import 'package:example/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final Color? overlayColor;
  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.overlayColor,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.green({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.label = label,
        this.onTap = onTap,
        this.borderColor = AppColors.green,
        this.overlayColor = Colors.green[900];

  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.label = label,
        this.onTap = onTap,
        this.borderColor = AppColors.border,
        this.overlayColor = Colors.grey[200];

  NextButtonWidget.purple({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.label = label,
        this.onTap = onTap,
        this.borderColor = AppColors.green,
        this.overlayColor = Colors.purple[900];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              overlayColor: MaterialStateProperty.all(overlayColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: borderColor),
              ))),
          onPressed: onTap,
          child: Text(label,
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: fontColor,
              )),
        ),
      ),
    );
  }
}
