import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MedicineItemShimmer extends StatelessWidget {
  const MedicineItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.grey[200]!, width: 1.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Container(
              height: 100.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.medication,
                  size: 60.sp,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),

            // Details placeholder
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Medicine name placeholder
                  Container(
                    height: 16.h,
                    width: double.infinity,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 6.h),

                  // Strength & Form placeholder
                  Row(
                    children: [
                      Expanded(
                        child: Container(height: 14.h, color: Colors.grey[400]),
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: Container(height: 14.h, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),

                  // Manufacturer placeholder
                  Container(
                    height: 12.h,
                    width: 100.w,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 8.h),

                  // Price placeholder
                  Container(height: 18.h, width: 80.w, color: Colors.grey[400]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
