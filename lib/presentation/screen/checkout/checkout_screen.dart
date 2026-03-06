import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sheba_ai/domain/model/cart/cart_item.dart';
import 'package:sheba_ai/presentation/screen/cart/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/my_orders/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/my_orders/state/my_orders_ui_state.dart'
    hide SuccessState;
import 'package:sheba_ai/presentation/screen/order_success/order_success_screen.dart';
import 'package:sheba_ai/presentation/screen/profile/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/profile/state/profile_ui_state.dart'
    hide ErrorState;
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/util/toast_helper.dart';
import 'package:sheba_ai/presentation/widget/custom_button.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';
import 'package:sheba_ai/presentation/widget/custom_form_field.dart';

import '../../util/routes.dart';

class CheckoutArgs {
  final List<CartItem> cartItems;
  final double totalPrice;

  CheckoutArgs({required this.cartItems, required this.totalPrice});
}

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final String _selectedPaymentMethod = 'cash_on_delivery';

  @override
  Widget build(BuildContext context) {
    //
    ref.listen<MyOrdersUiState>(myOrdersNotifierProvider, (previous, current) {
      current.maybeWhen(
        orderCreated: (order) {
          ref.read(cartNotifierProvider.notifier).clearCart();
          ToastHelper.showSuccess(context, "Order placed successfully.");
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.orderSuccess,
            (route) => false,
            arguments: OrderSuccessArgs(order: order),
          );
        },
        error: (message) {
          ToastHelper.showError(context, message);
        },
        orElse: () {},
      );
    }); //

    final args = ModalRoute.of(context)!.settings.arguments as CheckoutArgs;
    final cartItems = args.cartItems;
    final totalPrice = args.totalPrice;

    final profileUiState = ref.watch(profileNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: 'Checkout',
        leading: BackButton(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionCard(
                    title: 'Order Summary',
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cartItems[index];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: Row(
                                children: [
                                  Container(
                                    width: 50.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Icon(
                                      Icons.medication_outlined,
                                      size: 24.sp,
                                      color: AppColors.primary.withOpacity(0.5),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.medicine.name,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          'Qty: ${item.quantity}',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '৳${item.totalPrice.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Divider(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Amount',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '৳${totalPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  _buildSectionCard(
                    title: 'Shipping Information',
                    child: profileUiState.maybeWhen(
                      orElse: () => Text(
                        'Unable to load profile information.',
                        style: TextStyle(fontSize: 14.sp, color: Colors.red),
                      ),
                      loading: () => Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                      success: (profile) {
                        return FormBuilder(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomFormField(
                                initialValue: profile.address,
                                name: 'shipping_address',
                                labelText: 'Shipping Address',
                                hintText:
                                    'Enter your complete shipping address',
                                iconPath: 'assets/icons/ic-location.svg',
                                keyboardType: TextInputType.streetAddress,
                                textInputAction: TextInputAction.next,
                                onSubmitted: _handlePlaceOrder,
                                validators: profile.address.isNotEmpty
                                    ? []
                                    : [
                                        FormBuilderValidators.required(
                                          errorText:
                                              'Shipping address is required',
                                        ),
                                        FormBuilderValidators.minLength(
                                          10,
                                          errorText:
                                              'Please provide a complete address',
                                        ),
                                      ],
                              ),
                              SizedBox(height: 16.h),
                              CustomFormField(
                                initialValue: profile.phone,
                                name: 'phone_number',
                                labelText: 'Phone Number',
                                hintText: '01XXXXXXXXX',
                                iconPath: 'assets/icons/ic-phone.svg',
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                onSubmitted: _handlePlaceOrder,
                                validators: profile.phone.isNotEmpty
                                    ? []
                                    : [
                                        FormBuilderValidators.required(
                                          errorText: 'Phone number is required',
                                        ),
                                        FormBuilderValidators.minLength(
                                          11,
                                          errorText:
                                              'Enter a valid phone number',
                                        ),
                                      ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 16.h),

                  _buildSectionCard(
                    title: 'Payment Method',
                    child: Column(
                      children: [
                        _buildPaymentOption(
                          value: 'cash_on_delivery',
                          title: 'Cash on Delivery',
                          subtitle: 'Pay when you receive',
                          icon: Icons.money,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  _buildSectionCard(
                    title: 'Order Notes (Optional)',
                    child: FormBuilder(
                      child: CustomFormField(
                        name: 'notes',
                        labelText: 'Add a note',
                        hintText: 'Any special instructions for delivery...',
                        iconPath: 'assets/icons/ic-user.svg',
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
                        onSubmitted: _handlePlaceOrder,
                      ),
                    ),
                  ),

                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: CustomButton.primary(
                onPressed: _handlePlaceOrder,
                text: 'Place Order',
                width: double.infinity,
                borderRadius: 8.r,
                isLoading: ref
                    .watch(myOrdersNotifierProvider)
                    .maybeWhen(
                      loading: () => true,
                      error: (_) => false,
                      orElse: () => false,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 4.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption({
    required String value,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final isSelected = _selectedPaymentMethod == value;

    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.1)
              : Colors.grey[50],
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.grey[300],
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey[600],
                size: 20.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? AppColors.primary : Colors.black,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: AppColors.primary, size: 24.sp)
            else
              Icon(
                Icons.radio_button_unchecked,
                color: Colors.grey[400],
                size: 24.sp,
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _handlePlaceOrder() async {
    final isValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isValid) return;

    final formData = _formKey.currentState!.value;
    final profileState = ref.read(profileNotifierProvider);
    String shippingAddress = '';
    String phoneNumber = '';

    if (formData.containsKey('shipping_address') &&
        formData['shipping_address'] != null) {
      shippingAddress = formData['shipping_address'] as String;
    } else if (profileState is SuccessState) {
      shippingAddress = profileState.profile.address;
    }

    if (formData.containsKey('phone_number') &&
        formData['phone_number'] != null) {
      phoneNumber = formData['phone_number'] as String;
    } else if (profileState is SuccessState) {
      phoneNumber = profileState.profile.phone;
    }

    final paymentMethod = _selectedPaymentMethod;
    final notes = formData['notes'] as String?;
    final cartItems =
        (ModalRoute.of(context)!.settings.arguments as CheckoutArgs).cartItems;

    try {
      await ref
          .read(myOrdersNotifierProvider.notifier)
          .createOrder(
            shippingAddress: shippingAddress,
            phoneNumber: phoneNumber,
            paymentMethod: paymentMethod,
            notes: notes,
            items: cartItems,
          );
    } catch (e) {
      ToastHelper.showError(
        context,
        "Failed to place order. Please try again.",
      );
    }
  }
}
