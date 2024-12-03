import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_assement/core/util/app_colors.dart';

class FallbackMessage extends StatelessWidget {
  final String message;

  const FallbackMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(color: AppColors.error, fontSize: 16.sp),
        textAlign: TextAlign.center,
      ),
    );
  }
}
