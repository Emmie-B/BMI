import 'package:bmi/Constants/constants.dart';
import 'package:bmi/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/cards.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      this.calculateBMI,
      this.getResult,
      this.getInterpretation,
      this.getResultColor});

  final String? calculateBMI;
  final String? getResult;
  final Color? getResultColor;
  final String? getInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Result"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Contain(
                  color: activeContainColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        getResult.toString(),
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: getResultColor,
                        ),
                      ),
                      Text(
                        calculateBMI.toString(),
                        style: kBMITextStyle,
                      ),
                      Text(
                        getInterpretation.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            await Share.share(
                                " I have calculated my BMI with Emmie's BMI Calculator. Do yours now with the app. It's totally free");
                          },
                          child: Text('Share'))
                    ],
                  ),
                ),
              ),
            ),
            Calculate(
              label: 'Re-Calculate',
              route: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
