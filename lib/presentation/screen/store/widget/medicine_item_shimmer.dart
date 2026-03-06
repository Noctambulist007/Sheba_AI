import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MedicineItemShimmer extends StatelessWidget {
  const MedicineItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey[200]!, width: 1.w),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              SizedBox(height: 12.h),

              Container(
                height: 16.h,
                width: double.infinity,
                color: Colors.grey[300],
              ),
              SizedBox(height: 6.h),

              Row(
                children: [
                  Expanded(
                    child: Container(height: 14.h, color: Colors.grey[300]),
                  ),
                  SizedBox(width: 6.w),
                  Expanded(
                    child: Container(height: 14.h, color: Colors.grey[300]),
                  ),
                ],
              ),
              SizedBox(height: 6.h),

              Container(
                height: 12.h,
                width: 100.w,
                color: Colors.grey[300],
              ),
              SizedBox(height: 8.h),

              Row(
                children: [
                  Container(height: 18.h, width: 80.w, color: Colors.grey[300]),
                  const Spacer(),
                  Container(
                    height: 32.h,
                    width: 32.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
