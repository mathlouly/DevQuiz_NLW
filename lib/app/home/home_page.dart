import 'package:example/app/challenge/challenge_page.dart';
import 'package:example/app/home/home_state.dart';
import 'package:example/core/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/app_bar/app_bar_widget.dart';
import 'widgets/level_button/level_button_widget.dart';

import 'home_controller.dart';
import 'widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return controller.state == HomeState.success
        ? Scaffold(
            appBar: AppBarWidget(
              user: controller.user!,
            ),
            body: Column(
              children: [
                SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LevelButtonWidget(label: "Fácil"),
                        LevelButtonWidget(label: "Médio"),
                        LevelButtonWidget(label: "Difícil"),
                        LevelButtonWidget(label: "Perito"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Expanded(
                  child: GridView.count(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: controller.quizzes!
                        .map((e) => QuizCardWidget(
                              title: e.title,
                              completed: "${e.questionsAnswered} de ${e.questions.length}",
                              progressValue: e.questionsAnswered / e.questions.length,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChallengePage(
                                              questions: e.questions,
                                              title: e.title,
                                            )));
                              },
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
              ),
            ),
          );
  }
}
