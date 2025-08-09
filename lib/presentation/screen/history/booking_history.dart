import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/theme/text_styles.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: 'Booking History',
        showSearch: false,
        showCart: false,
        leading: BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stats Cards Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatsCard(
                    count: "15",
                    label: "Total",
                    countColor: Colors.black,
                  ),
                  _buildStatsCard(
                    count: "8",
                    label: "Completed",
                    countColor: AppColors.colorPrimary,
                  ),
                  _buildStatsCard(
                    count: "7",
                    label: "Cancelled",
                    countColor: AppColors.blood,
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // Booking History List
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _dummyBookingHistory.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  final booking = _dummyBookingHistory[index];
                  return _buildBookingCard(booking);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsCard({
    required String count,
    required String label,
    required Color countColor,
  }) {
    return Expanded(
      child: Container(
        height: 80.h,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F2FE),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count,
              style: AppTextStyles.labelL5Semibold.copyWith(color: countColor),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: AppTextStyles.labelL6Regular.copyWith(
                color: countColor.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingCard(BookingHistoryModel booking) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          // Product Info Row
          Row(
            children: [
              // Product Image with New Badge
              Stack(
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          booking.productColor,
                          booking.productColor.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Icon(
                      booking.productIcon,
                      color: Colors.white,
                      size: 30.w,
                    ),
                  ),
                  if (booking.isNew)
                    Positioned(
                      top: -2.h,
                      left: -2.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          "New",
                          style: AppTextStyles.labelL6Regular.copyWith(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 12.w),

              // Product Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking.productName,
                      style: AppTextStyles.labelL5Semibold.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      booking.brandName,
                      style: AppTextStyles.labelL6Regular.copyWith(
                        color: AppColors.colorPrimary,
                      ),
                    ),
                    SizedBox(height: 4.h),

                    // Rating
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16.w),
                        SizedBox(width: 4.w),
                        Text(
                          "${booking.rating} (${booking.reviewCount})",
                          style: AppTextStyles.labelL6Regular.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),

                    // Price Row
                    Row(
                      children: [
                        Text(
                          "৳${booking.currentPrice}",
                          style: AppTextStyles.labelL5Semibold.copyWith(
                            color: AppColors.colorPrimary,
                          ),
                        ),
                        if (booking.originalPrice != null) ...[
                          Text(
                            "/hr",
                            style: AppTextStyles.labelL6Regular.copyWith(
                              color: AppColors.colorPrimary,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "৳${booking.originalPrice}/hr",
                            style: AppTextStyles.labelL6Regular.copyWith(
                              color: Colors.grey[500],
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                        if (booking.rentPrice != null) ...[
                          SizedBox(width: 8.w),
                          Text(
                            "Rent ৳${booking.rentPrice}/day",
                            style: AppTextStyles.labelL6Regular.copyWith(
                              color: Colors.pink,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),

              // Status Badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: _getStatusColor(booking.status).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  booking.status,
                  style: AppTextStyles.labelL6Regular.copyWith(
                    color: _getStatusColor(booking.status),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Action Buttons Row
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Handle book again action
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.colorPrimary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: Text(
                    "Book Again",
                    style: AppTextStyles.labelL6Semibold.copyWith(
                      color: AppColors.colorPrimary,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle rate service action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.colorPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: Text(
                    "Rate Service",
                    style: AppTextStyles.labelL6Semibold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return AppColors.colorPrimary;
      case 'cancelled':
      case 'canceled':
        return AppColors.blood;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  // Dummy data for booking history
  static final List<BookingHistoryModel> _dummyBookingHistory = [
    BookingHistoryModel(
      productName: "Accu-Chek Glucometer Kit",
      brandName: "Accu-chek",
      currentPrice: 700,
      originalPrice: 800,
      rating: 4.8,
      reviewCount: 111,
      status: "Cancelled",
      isNew: true,
      productIcon: Icons.medical_services,
      productColor: Colors.indigo,
    ),
    BookingHistoryModel(
      productName: "Accu-Chek Glucometer Kit",
      brandName: "Accu-chek",
      currentPrice: 700,
      originalPrice: 800,
      rating: 4.8,
      reviewCount: 111,
      status: "Cancelled",
      isNew: true,
      productIcon: Icons.medical_services,
      productColor: Colors.indigo,
    ),
    BookingHistoryModel(
      productName: "Omron Digital Blood Pressure Monitor",
      brandName: "Omron",
      currentPrice: 700,
      rentPrice: 50,
      rating: 4.8,
      reviewCount: 111,
      status: "Cancelled",
      isNew: true,
      productIcon: Icons.monitor_heart,
      productColor: Colors.indigo,
    ),
    BookingHistoryModel(
      productName: "Digital Thermometer",
      brandName: "Braun",
      currentPrice: 450,
      originalPrice: 500,
      rating: 4.6,
      reviewCount: 89,
      status: "Completed",
      isNew: false,
      productIcon: Icons.thermostat,
      productColor: Colors.teal,
    ),
    BookingHistoryModel(
      productName: "Pulse Oximeter",
      brandName: "Beurer",
      currentPrice: 600,
      rentPrice: 30,
      rating: 4.9,
      reviewCount: 156,
      status: "Completed",
      isNew: true,
      productIcon: Icons.favorite,
      productColor: Colors.purple,
    ),
    BookingHistoryModel(
      productName: "Nebulizer Machine",
      brandName: "Philips",
      currentPrice: 1200,
      originalPrice: 1400,
      rating: 4.7,
      reviewCount: 203,
      status: "Pending",
      isNew: false,
      productIcon: Icons.air,
      productColor: Colors.blue,
    ),
    BookingHistoryModel(
      productName: "ECG Monitor",
      brandName: "Mindray",
      currentPrice: 2500,
      rentPrice: 150,
      rating: 4.5,
      reviewCount: 67,
      status: "Completed",
      isNew: true,
      productIcon: Icons.monitor_heart_outlined,
      productColor: Colors.red,
    ),
  ];
}

// Model class for booking history
class BookingHistoryModel {
  final String productName;
  final String brandName;
  final int currentPrice;
  final int? originalPrice;
  final int? rentPrice;
  final double rating;
  final int reviewCount;
  final String status;
  final bool isNew;
  final IconData productIcon;
  final Color productColor;

  BookingHistoryModel({
    required this.productName,
    required this.brandName,
    required this.currentPrice,
    this.originalPrice,
    this.rentPrice,
    required this.rating,
    required this.reviewCount,
    required this.status,
    required this.isNew,
    required this.productIcon,
    required this.productColor,
  });
}
