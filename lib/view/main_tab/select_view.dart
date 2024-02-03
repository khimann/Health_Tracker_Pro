import 'package:fitness/common_widget/round_button.dart';
import 'package:flutter/material.dart';

class SelectView extends StatelessWidget {
  const SelectView({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
                title: "Workout Tracker",
                onPressed: () {

                }),

                const SizedBox(height: 15,),

                  RoundButton(
                title: "Meal Planner",
                onPressed: () {
                  Navigator.pushNamed(context, '/calorie_counter');
                }),

                const SizedBox(height: 15,),

                  RoundButton(
                title: "Sleep Tracker",
                onPressed: () {

                })
          ],
        ),
      ),
    );
  }
}
