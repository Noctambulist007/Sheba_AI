import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sheba_ai/presentation/theme/color.dart';

class MyOrderItemShimmer extends StatelessWidget {
  const MyOrderItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey[200]!, width: 1),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80.w,
                          height: 10.h,
                          color: Colors.grey[300],
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          width: 120.w,
                          height: 14.h,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 80.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),
              Divider(color: Colors.grey[200], height: 1),
              SizedBox(height: 16.h),

              Row(
                children: [
                  Expanded(child: _shimmerBox(width: double.infinity, height: 40.h)),
                  SizedBox(width: 12.w),
                  Expanded(child: _shimmerBox(width: double.infinity, height: 40.h)),
                ],
              ),
              SizedBox(height: 12.h),

              Row(
                children: [
                  Expanded(child: _shimmerBox(width: double.infinity, height: 40.h)),
                  SizedBox(width: 12.w),
                  Expanded(child: _shimmerBox(width: double.infinity, height: 40.h)),
                ],
              ),
              SizedBox(height: 12.h),

              Row(
                children: [
                  _shimmerBox(width: 16.w, height: 16.h),
                  SizedBox(width: 6.w),
                  _shimmerBox(width: 120.w, height: 14.h),
                  const Spacer(),
                  _shimmerBox(width: 14.w, height: 14.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shimmerBox({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}
