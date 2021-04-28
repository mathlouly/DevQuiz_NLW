import 'package:example/app/challenge/widgets/next_button/next_button_widget.dart';
import 'package:example/core/app_images.dart';
import 'package:example/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;
  ResultPage({required this.title, required this.length, required this.result});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(child: Image.asset(AppImages.trophy)),
                SizedBox(height: 20),
                Text(
                  "Parabéns",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu\n",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(text: "$title\n", style: AppTextStyles.bodyBold),
                      TextSpan(text: "com $result de $length acertos", style: AppTextStyles.bodyBold),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 68),
                  child: Row(
                    children: [
                      NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share("$title: Quantidade de Acertos do Quiz: $result\nObtive: ${((result / length) * 100).toStringAsFixed(2)}% aproveitamento!");
                          }),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 68),
                  child: Row(
                    children: [
                      NextButtonWidget.white(
                          label: "Voltar ao ínicio",
                          onTap: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
