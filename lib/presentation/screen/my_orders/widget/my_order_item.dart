import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/domain/model/order/list_of_order_item.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:timeago/timeago.dart' as timeago;

class MyOrderItemCard extends StatelessWidget {
  final ListOfOrderItem order;
  final VoidCallback? onTap;

  const MyOrderItemCard({super.key, required this.order, this.onTap});

  Color _getStatusColor() {
    switch (order.status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'confirmed':
        return Colors.blue;
      case 'processing':
        return Colors.purple;
      case 'shipped':
        return Colors.indigo;
      case 'delivered':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon() {
    switch (order.status.toLowerCase()) {
      case 'pending':
        return Icons.schedule;
      case 'confirmed':
        return Icons.check_circle_outline;
      case 'processing':
        return Icons.sync;
      case 'shipped':
        return Icons.local_shipping_outlined;
      case 'delivered':
        return Icons.done_all;
      case 'cancelled':
        return Icons.cancel_outlined;
      default:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor();

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey[200]!, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Order Number
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Number',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            order.orderNumber,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Status Badge
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: statusColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _getStatusIcon(),
                            size: 14.sp,
                            color: statusColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            order.statusDisplay,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: statusColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                // Divider
                Divider(color: Colors.grey[200], height: 1),

                SizedBox(height: 16.h),

                // Order Details
                Row(
                  children: [
                    // Items Count
                    Expanded(
                      child: _buildInfoItem(
                        icon: Icons.shopping_bag_outlined,
                        label: 'Items',
                        value: '${order.itemCount}',
                        iconColor: Colors.blue,
                      ),
                    ),

                    // Total Price
                    Expanded(
                      child: _buildInfoItem(
                        icon: Icons.payments_outlined,
                        label: 'Total',
                        value: '৳${order.totalPrice}',
                        iconColor: Colors.green,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                // Payment Method & Date
                Row(
                  children: [
                    // Payment Method
                    Expanded(
                      child: _buildInfoItem(
                        icon: Icons.payment,
                        label: 'Payment',
                        value: order.paymentMethodDisplay,
                        iconColor: Colors.purple,
                      ),
                    ),

                    // Date
                    Expanded(
                      child: _buildInfoItem(
                        icon: Icons.access_time,
                        label: 'Date',
                        value: timeago.format(
                          DateTime.parse(order.createdAt),
                          locale: 'en_short',
                        ),
                        iconColor: Colors.orange,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                // Payment Status
                Row(
                  children: [
                    Icon(
                      order.paymentStatus
                          ? Icons.check_circle
                          : Icons.pending_outlined,
                      size: 16.sp,
                      color: order.paymentStatus ? Colors.green : Colors.orange,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      order.paymentStatus
                          ? 'Payment Completed'
                          : 'Payment Pending',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: order.paymentStatus
                            ? Colors.green
                            : Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // const Spacer(),
                    // Icon(
                    //   Icons.arrow_forward_ios,
                    //   size: 14.sp,
                    //   color: Colors.grey[400],
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
    required Color iconColor,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, size: 16.sp, color: iconColor),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
