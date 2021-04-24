import 'package:example/core/app_gradients.dart';
import 'package:example/core/app_text_styles.dart';
import 'package:example/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Stack(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  gradient: AppGradients.linear,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(text: "Dev", style: AppTextStyles.titleBold),
                          ],
                        ),
                      ),
                      Container(
                        height: 58,
                        width: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: NetworkImage("https://avatars.githubusercontent.com/u/53306408?v=4")),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.0, 1.0),
                child: ScoreCardWidget(),
              ),
            ],
          ),
        );
}
