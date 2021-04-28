import 'package:example/core/app_colors.dart';
import 'package:example/core/app_images.dart';
import 'package:example/core/app_text_styles.dart';
import 'package:example/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double progressValue;
  final VoidCallback onTap;
  const QuizCardWidget({Key? key, required this.title, required this.completed, required this.progressValue, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(height: 24),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    completed,
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(flex: 2, child: ProgressIndicatorWidget(value: progressValue)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
