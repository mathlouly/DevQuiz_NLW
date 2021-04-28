import 'package:example/core/app_colors.dart';
import 'package:example/core/app_text_styles.dart';
import 'package:example/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelect;
  final ValueChanged<bool> onTap;
  final bool disabled;
  AnswerWidget({Key? key, required this.answer, this.isSelect = false, required this.onTap, this.disabled = false}) : super(key: key);

  Color get _selectedColorRight => isSelect
      ? answer.isRight
          ? AppColors.darkGreen
          : AppColors.darkRed
      : AppColors.white;

  Color get _selectBorderRight => isSelect
      ? answer.isRight
          ? AppColors.lightGreen
          : AppColors.lightRed
      : AppColors.white;

  Color get _selectedColorCardRight => isSelect
      ? answer.isRight
          ? AppColors.lightGreen
          : AppColors.lightRed
      : AppColors.white;

  Color get _selectBorderCardRight => isSelect
      ? answer.isRight
          ? AppColors.green
          : AppColors.red
      : AppColors.white;

  TextStyle get _selectedTextStyleRight => isSelect
      ? answer.isRight
          ? AppTextStyles.bodyDarkGreen
          : AppTextStyles.bodyDarkRed
      : AppTextStyles.body;

  IconData get _selectedIconRight => answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: () {
            onTap(answer.isRight);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _selectedColorCardRight,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(BorderSide(color: _selectBorderCardRight)),
            ),
            child: Row(
              children: [
                Expanded(child: Text(answer.title, style: _selectedTextStyleRight)),
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
        ),
      ),
    );
  }
}
