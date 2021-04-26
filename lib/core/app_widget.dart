import 'package:example/app/challenge/challenge_page.dart';

import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DevQuiz",
      home: ChallengePage(),
    );
  }
}
