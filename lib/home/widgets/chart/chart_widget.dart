import 'package:example/core/app_colors.dart';
import 'package:example/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          "80%",
          style: AppTextStyles.heading,
        ),
        Container(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(
            strokeWidth: 10,
            value: 0.75,
            backgroundColor: AppColors.chartSecondary,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
          ),
        ),
      ],
    );
  }
}
