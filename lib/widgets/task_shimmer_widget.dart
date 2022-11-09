import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/widgets/settings_widget.dart';
import 'package:shimmer/shimmer.dart';

Widget taskShimmer() {
  return Container(
    padding: const EdgeInsets.all(14).r,
    margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12).r,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Row(
          children: [
            SizedBox(
              width: 20.w,
              height: 20.h,
              child: Shimmer.fromColors(
                baseColor: !isDark ? Colors.grey[300]! : Colors.grey[800]!,
                highlightColor: !isDark ? Colors.grey[100]! : Colors.grey[600]!,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            SizedBox(
              width: 100.w,
              height: 30.h,
              child: Shimmer.fromColors(
                baseColor: !isDark ? Colors.grey[300]! : Colors.grey[800]!,
                highlightColor: !isDark ? Colors.grey[100]! : Colors.grey[600]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 155.w,
              height: 30.h,
              child: Shimmer.fromColors(
                baseColor: !isDark ? Colors.grey[300]! : Colors.grey[800]!,
                highlightColor: !isDark ? Colors.grey[100]! : Colors.grey[600]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 100.w,
                  height: 30.h,
                  child: Shimmer.fromColors(
                    baseColor: !isDark ? Colors.grey[300]! : Colors.grey[800]!,
                    highlightColor:
                        !isDark ? Colors.grey[100]! : Colors.grey[600]!,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                SizedBox(
                  width: 50.w,
                  height: 30.h,
                  child: Shimmer.fromColors(
                    baseColor: !isDark ? Colors.grey[300]! : Colors.grey[800]!,
                    highlightColor:
                        !isDark ? Colors.grey[100]! : Colors.grey[600]!,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
