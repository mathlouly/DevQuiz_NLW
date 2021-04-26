import 'package:example/core/app_colors.dart';
import 'package:example/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelect;
  AwnserWidget({Key? key, required this.title, this.isRight = false, this.isSelect = false}) : super(key: key);

  Color get _selectedColorRight => isSelect
      ? isRight
          ? AppColors.darkGreen
          : AppColors.darkRed
      : AppColors.white;

  Color get _selectBorderRight => isSelect
      ? isRight
          ? AppColors.lightGreen
          : AppColors.lightRed
      : AppColors.white;

  Color get _selectedColorCardRight => isSelect
      ? isRight
          ? AppColors.lightGreen
          : AppColors.lightRed
      : AppColors.white;

  Color get _selectBorderCardRight => isSelect
      ? isRight
          ? AppColors.green
          : AppColors.red
      : AppColors.white;

  TextStyle get _selectedTextStyleRight => isSelect
      ? isRight
          ? AppTextStyles.bodyDarkGreen
          : AppTextStyles.bodyDarkRed
      : AppTextStyles.body;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _selectedColorCardRight,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(color: _selectBorderCardRight)),
        ),
        child: Row(
          children: [
            Expanded(child: Text(title, style: _selectedTextStyleRight)),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.fromBorderSide(BorderSide(color: _selectBorderRight)),
                color: _selectedColorRight,
              ),
              height: 24,
              width: 24,
              child: isSelect
                  ? Icon(
                      _selectedIconRight,
                      size: 16,
                      color: AppColors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
