import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sheba_ai/presentation/screen/cart/state/cart_state.dart';
import 'package:sheba_ai/presentation/screen/cart/notifier/provider.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  final TextEditingController _couponController = TextEditingController();

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartNotifierProvider);
    
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: 'My Cart',
        leading: BackButton(color: Colors.white),
      ),
      body: cartState.items.isEmpty
          ? _buildEmptyCart()
          : Column(
              children: [
                // Cart Items List
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16.w),
                    itemCount: cartState.items.length,
                    itemBuilder: (context, index) {
                      final item = cartState.items[index];
                      return Card(
                        margin: EdgeInsets.only(bottom: 12.h),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          side: BorderSide(color: Colors.grey.shade200),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Medicine Icon
                              Container(
                                width: 70.w,
                                height: 70.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.medication_outlined,
                                    size: 36.sp,
                                    color: AppColors.primary.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              // Medicine Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.medicine.name,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      item.medicine.manufacturer.name,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      '${item.medicine.formattedPrice ?? "৳${item.medicine.price}"} / ${item.medicine.unit}',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Quantity Controls
                              Column(
                                children: [
                                  // Remove Button
                                  InkWell(
                                    onTap: () {
                                      ref.read(cartNotifierProvider.notifier).removeFromCart(
                                          item.medicine.medicineId);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4.w),
                                      decoration: BoxDecoration(
                                        color: Colors.red[50],
                                        borderRadius: BorderRadius.circular(4.r),
                                      ),
                                      child: Icon(
                                        Icons.delete_outline,
                                        size: 18.sp,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  // Quantity Controls
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          ref.read(cartNotifierProvider.notifier)
                                              .decrementQuantity(
                                                  item.medicine.medicineId);
                                        },
                                        child: Container(
                                          width: 28.w,
                                          height: 28.h,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                          ),
                                          child: Icon(Icons.remove,
                                              size: 16.sp, color: Colors.black),
                                        ),
                                      ),
                                      Container(
                                        width: 36.w,
                                        height: 28.h,
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${item.quantity}',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          ref.read(cartNotifierProvider.notifier)
                                              .incrementQuantity(
                                                  item.medicine.medicineId);
                                        },
                                        child: Container(
                                          width: 28.w,
                                          height: 28.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                          ),
                                          child: Icon(Icons.add,
                                              size: 16.sp, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                // Coupon Code Section
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
                  child: Column(
                    children: [
                      // Coupon Input
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _couponController,
                              decoration: InputDecoration(
                                hintText: 'Enter coupon code',
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 12.h,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          ElevatedButton(
                            onPressed: () {
                              if (_couponController.text.isNotEmpty) {
                                ref.read(cartNotifierProvider.notifier)
                                    .applyCoupon(_couponController.text);
                                FocusScope.of(context).unfocus();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                vertical: 12.h,
                                horizontal: 16.w,
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: AppColors.primary, width: 1),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Text(
                              'Apply',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 16.h),
                      
                      // Price Summary
                      Column(
                        children: [
                          _buildPriceSummaryRow('Subtotal', '৳${cartState.subtotal.toStringAsFixed(2)}'),
                          if (cartState.discount > 0) ...[
                            SizedBox(height: 8.h),
                            _buildPriceSummaryRow(
                              'Discount${cartState.couponCode != null ? ' (${cartState.couponCode})' : ''}',
                              '-৳${cartState.discount.toStringAsFixed(2)}',
                              valueColor: Colors.green,
                            ),
                          ],
                          SizedBox(height: 8.h),
                          Divider(),
                          SizedBox(height: 8.h),
                          _buildPriceSummaryRow(
                            'Total',
                            '৳${cartState.total.toStringAsFixed(2)}',
                            isBold: true,
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 20.h),
                      
                      // Checkout Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/checkout');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          minimumSize: Size(double.infinity, 56.h),
                        ),
                        child: Text(
                          'Proceed to Checkout',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
  
  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80.sp,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16.h),
          Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Add medicines to your cart',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 12.h,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'Continue Shopping',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSummaryRow(String label, String value, {Color? valueColor, bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: Colors.grey[700],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
