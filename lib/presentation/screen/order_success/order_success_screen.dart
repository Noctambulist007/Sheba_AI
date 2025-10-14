import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:sheba_ai/domain/model/order/create_order.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/util/routes.dart';
import 'package:sheba_ai/presentation/widget/custom_button.dart';

class OrderSuccessArgs {
  final CreateOrder order;

  OrderSuccessArgs({required this.order});
}

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as OrderSuccessArgs;

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: CustomButton.primary(
            borderRadius: 8,
            text: 'Continue Shopping',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.main,
                (route) => false,
              );
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Success checkmark circle
                  SizedBox(
                    height: 220.h,
                    width: 220.w,
                    child: Lottie.asset(
                      'assets/anims/done.json',
                      repeat: false,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Thank you text
                  const Text(
                    'Thank you',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1D3A),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Order details
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text:  TextSpan(
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Your order has been placed successfully!\n\n',
                          ),
                          TextSpan(
                            text: 'Order Number: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          TextSpan(
                            text: '${args.order.orderNumber}\n\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.colorPrimary,
                            ),
                          ),
                          TextSpan(
                            text:
                                'We will notify you once your order is on its way.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
