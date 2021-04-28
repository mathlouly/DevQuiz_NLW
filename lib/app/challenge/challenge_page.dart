import 'package:example/app/challenge/challenge_controller.dart';
import 'package:example/app/challenge/widgets/next_button/next_button_widget.dart';
import 'package:example/app/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:example/app/challenge/widgets/quiz/quiz_widget.dart';
import 'package:example/app/result/result_page.dart';
import 'package:example/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  const ChallengePage({Key? key, required this.questions, required this.title}) : super(key: key);
  @override
  ChallengePageState createState() => ChallengePageState();
}

class ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if (!isLastPage) pageController.nextPage(duration: Duration(milliseconds: 700), curve: Curves.fastLinearToSlowEaseIn);
  }

  void onSelected(bool value) {
    if (value == true) controller.qtdAnswerRight++;
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
            child: ValueListenableBuilder<int>(
          valueListenable: controller.currentPageNotifier,
          builder: (context, value, _) => QuestionIndicatorWidget(
            currentPage: value,
            length: widget.questions.length,
          ),
        )),
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: controller.currentPageNotifier,
        builder: (context, value, _) {
          return PageView(
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              if (value == widget.questions.length - 1) isLastPage = true;
            },
            scrollDirection: Axis.vertical,
            controller: pageController,
            children: widget.questions
                .map((e) => QuizWidget(
                      question: e,
                      onSelected: onSelected,
                    ))
                .toList(),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                value != widget.questions.length
                    ? NextButtonWidget.white(
                        label: "Pular",
                        onTap: nextPage,
                      )
                    : NextButtonWidget.green(
                        label: "Confirmar",
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                        title: widget.title,
                                        length: widget.questions.length,
                                        result: controller.qtdAnswerRight,
                                      )));
                        }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
