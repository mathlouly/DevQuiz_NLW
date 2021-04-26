import 'package:example/core/core.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final String title;
  const ChartWidget({Key? key, this.title = "ChartWidget"}) : super(key: key);

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
