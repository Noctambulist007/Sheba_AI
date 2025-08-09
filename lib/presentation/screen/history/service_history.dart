import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/theme/text_styles.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class ServiceHistory extends StatelessWidget {
  const ServiceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: 'Service History',
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
                    count: "12",
                    label: "Total",
                    countColor: Colors.black,
                  ),
                  _buildStatsCard(
                    count: "8",
                    label: "Completed",
                    countColor: AppColors.colorPrimary,
                  ),
                  _buildStatsCard(
                    count: "4",
                    label: "Canceled",
                    countColor: AppColors.blood,
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // Service History List
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _dummyServiceHistory.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  final service = _dummyServiceHistory[index];
                  return _buildServiceCard(service);
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

  Widget _buildServiceCard(ServiceHistoryModel service) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          // Doctor Info Row
          Row(
            children: [
              // Doctor Image
              Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(service.doctorImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12.w),

              // Doctor Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.doctorName,
                      style: AppTextStyles.labelL4Semibold.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      service.specialty,
                      style: AppTextStyles.labelL6Regular.copyWith(
                        color: AppColors.colorPrimary,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    // Price and Distance Row
                    Row(
                      children: [
                        Text(
                          "৳${service.price}/hr",
                          style: AppTextStyles.labelL5Semibold.copyWith(
                            color: AppColors.colorPrimary,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Icon(
                          Icons.location_on,
                          color: Colors.grey[500],
                          size: 16.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "${service.distance} km",
                          style: AppTextStyles.labelL6Regular.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Rating and Status
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16.w),
                      SizedBox(width: 2.w),
                      Text(
                        "${service.rating} (${service.reviewCount})",
                        style: AppTextStyles.labelL6Regular.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: service.status == 'Completed'
                          ? AppColors.colorPrimary.withOpacity(0.1)
                          : AppColors.blood.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      service.status,
                      style: AppTextStyles.labelL6Regular.copyWith(
                        color: service.status == 'Completed'
                            ? AppColors.colorPrimary
                            : AppColors.blood,
                      ),
                    ),
                  ),
                ],
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

  // Dummy data
  static final List<ServiceHistoryModel> _dummyServiceHistory = [
    ServiceHistoryModel(
      doctorName: "Dr. Jameur Rahman",
      specialty: "Nursing Care",
      price: 500,
      distance: 2.5,
      rating: 5.0,
      reviewCount: 211,
      status: "Completed",
      doctorImage:
          "assets/images/doctor-demo.png", // Replace with your asset path
    ),
    ServiceHistoryModel(
      doctorName: "Dr. Sarah Ahmed",
      specialty: "Physiotherapy",
      price: 750,
      distance: 3.2,
      rating: 4.8,
      reviewCount: 156,
      status: "Completed",
      doctorImage: "assets/images/doctor-demo.png",
    ),
    ServiceHistoryModel(
      doctorName: "Dr. Mohammad Ali",
      specialty: "Home Care",
      price: 600,
      distance: 1.8,
      rating: 4.9,
      reviewCount: 189,
      status: "Canceled",
      doctorImage: "assets/images/doctor-demo.png",
    ),
    ServiceHistoryModel(
      doctorName: "Dr. Fatima Khan",
      specialty: "Nursing Care",
      price: 550,
      distance: 4.1,
      rating: 4.7,
      reviewCount: 98,
      status: "Completed",
      doctorImage: "assets/images/doctor-demo.png",
    ),
    ServiceHistoryModel(
      doctorName: "Dr. Rakib Hassan",
      specialty: "Elder Care",
      price: 650,
      distance: 2.9,
      rating: 4.6,
      reviewCount: 134,
      status: "Completed",
      doctorImage: "assets/images/doctor-demo.png",
    ),
    ServiceHistoryModel(
      doctorName: "Dr. Nusrat Jahan",
      specialty: "Nursing Care",
      price: 500,
      distance: 3.5,
      rating: 4.8,
      reviewCount: 167,
      status: "Canceled",
      doctorImage: "assets/images/doctor-demo.png",
    ),
  ];
}

// Model class for service history
class ServiceHistoryModel {
  final String doctorName;
  final String specialty;
  final int price;
  final double distance;
  final double rating;
  final int reviewCount;
  final String status;
  final String doctorImage;

  ServiceHistoryModel({
    required this.doctorName,
    required this.specialty,
    required this.price,
    required this.distance,
    required this.rating,
    required this.reviewCount,
    required this.status,
    required this.doctorImage,
  });
}
