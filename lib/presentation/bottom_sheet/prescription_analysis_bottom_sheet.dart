import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sheba_ai/domain/model/medicine/dosage_form.dart';
import 'package:sheba_ai/domain/model/medicine/generic.dart';
import 'package:sheba_ai/domain/model/medicine/manufacturer.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';
import 'package:sheba_ai/domain/model/prescription/analyze_prescription.dart';
import 'package:sheba_ai/domain/model/prescription/matched_medicine.dart';
import 'package:sheba_ai/domain/model/prescription/unmatched_medicine.dart';
import 'package:sheba_ai/presentation/screen/cart/notifier/provider.dart';
import 'package:sheba_ai/presentation/util/routes.dart';
import 'package:sheba_ai/presentation/util/toast_helper.dart';
import 'package:sheba_ai/presentation/widget/custom_button.dart';

class PrescriptionAnalysisBottomSheet extends ConsumerWidget {
  final AnalyzePrescription analysis;

  const PrescriptionAnalysisBottomSheet({super.key, required this.analysis});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Lottie.asset(
                'assets/anims/ai-report.json',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
                repeat: true,
              ),
              SizedBox(height: 8),
              const Text(
                'Analysis Results',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    if (analysis.matchedMedicines?.isNotEmpty ?? false)
                      _buildMatchedMedicineList(
                        context,
                        ref,
                        'Matched Medicines',
                        analysis.matchedMedicines!,
                      ),
                    if (analysis.unmatchedMedicines?.isNotEmpty ?? false)
                      _buildUnmatchedMedicineList(
                        'Unmatched Medicines',
                        analysis.unmatchedMedicines!,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              CustomButton.primary(
                text: 'Go to Cart',
                onPressed: () {
                  Navigator.pop(context); // Close bottom sheet
                  Navigator.pushNamed(context, Routes.cart);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMatchedMedicineList(
    BuildContext context,
    WidgetRef ref,
    String title,
    List<MatchedMedicine> medicines,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: medicines.length,
          itemBuilder: (context, index) {
            final medicine = medicines[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 4),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            medicine.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(medicine.genericName),
                          const SizedBox(height: 4),
                          Text(
                            'Price: ${medicine.price} TK',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          final med = Medicine(
                            medicineId: medicine.id,
                            name: medicine.name,
                            slug: '',
                            strength: '',
                            manufacturer: Manufacturer(
                              manufacturerId: 0,
                              name: '',
                              slug: '',
                              genericsCount: 0,
                              brandNamesCount: 0,
                              createdAt: '',
                              updatedAt: '',
                            ),
                            generic: Generic(
                              genericId: 0,
                              name: medicine.genericName,
                              slug: '',
                              brandNamesCount: 0,
                            ),
                            dosageForm: DosageForm(
                              dosageFormId: 0,
                              name: '',
                              slug: '',
                              genericsCount: 0,
                              createdAt: '',
                              updatedAt: '',
                            ),
                            price: medicine.price,
                            unit: '',
                          );
                          final cartNotifier = ref.read(
                            cartNotifierProvider.notifier,
                          );

                          // Try to add to cart, returns false if user is not authenticated
                          final success = cartNotifier.addToCart(med);

                          if (success) {
                            // Successfully added to cart
                            ToastHelper.showSuccess(
                              context,
                              '${medicine.name} added to cart',
                            );
                          } else {
                            // User is not authenticated, show login prompt
                            ToastHelper.showError(
                              context,
                              'Please login to order',
                            );
                            Navigator.pop(context); // Close bottom sheet
                            Navigator.pushNamed(context, Routes.signIn);
                          }
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.add_shopping_cart),
                            const SizedBox(width: 4),
                            const Text('Add', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildUnmatchedMedicineList(
    String title,
    List<UnmatchedMedicine> medicines,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: medicines.length,
          itemBuilder: (context, index) {
            final medicine = medicines[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 4),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  medicine.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
