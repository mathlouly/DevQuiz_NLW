import 'package:example/app/challenge/widget/question_indicator/question_indicator_widget.dart';
import 'package:example/app/challenge/widget/quiz/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final String title;
  const ChallengePage({Key? key, this.title = 'ChallengePage'}) : super(key: key);
  @override
  ChallengePageState createState() => ChallengePageState();
}

class ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: QuestionIndicatorWidget()),
      ),
      body: QuizWidget(title: "O que o Flutter faz em sua totalidade ?"),
    );
  }
}
