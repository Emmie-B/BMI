import 'package:bmi/model/calculator.dart';
import 'package:bmi/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Constants/constants.dart';
import '../widgets/cards.dart';
import '../widgets/icon_contents.dart';

enum GenderType { Male, Female }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GenderType? selectedGender;
  double _height = 120;
  double _wieght = 50;
  int _age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Contain(
                  onPress: () {
                    setState(() {
                      selectedGender = GenderType.Male;
                    });
                  },
                  color: selectedGender == GenderType.Male
                      ? KActiveColor
                      : inActiveContainColor,
                  cardChild: Gender(
                    gender: 'MALE',
                    icon: FontAwesomeIcons.mars,
                  ),
                ),
              ),
              Expanded(
                child: Contain(
                  onPress: () {
                    setState(() {
                      selectedGender = GenderType.Female;
                    });
                  },
                  color: selectedGender == GenderType.Female
                      ? KActiveColor
                      : inActiveContainColor,
                  cardChild:
                      Gender(gender: 'FEMALE', icon: FontAwesomeIcons.venus),
                ),
              ),
            ],
          ),
          Expanded(
            child: Contain(
              color: activeContainColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: KTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _height.toString(),
                        style: KNumberStyle,
                      ),
                      Text(
                        'cm',
                        // style: KTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: KActiveSliderColor,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      thumbColor: KActiveColor,
                      min: 120,
                      max: 220,
                      overlayColor:
                          MaterialStateProperty.all(Color(0x29EB1555)),
                      activeColor: KActiveSliderColor,
                      inactiveColor: KInctiveSliderColor,
                      value: _height,
                      onChanged: (double value) {
                        setState(() {
                          _height = value.roundToDouble();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Contain(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: KTextStyle,
                      ),
                      Text(
                        '$_wieght',
                        style: KNumberStyle,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: KIconColor,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _wieght -= 1;
                                });
                              },
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          CircleAvatar(
                            backgroundColor: KIconColor,
                            radius: 25,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _wieght += 1;
                                });
                              },
                              icon: Icon(FontAwesomeIcons.plus),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  color: activeContainColor,
                ),
              ),
              Expanded(
                child: Contain(
                  color: activeContainColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE", style: KTextStyle),
                      Text(
                        '$_age',
                        style: KNumberStyle,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: KIconColor,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _age -= 1;
                                });
                              },
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          CircleAvatar(
                            backgroundColor: KIconColor,
                            radius: 25,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _age += 1;
                                  });
                                },
                                icon: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Calculate(
            label: "Calculate",
            route: () {
              Calculation calc = Calculation(height: _height, weight: _wieght);
              calc.checkBmi();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    calculateBMI: calc.checkBmi(),
                    getResult: calc.getResult(),
                    getInterpretation: calc.getInterpretation(),
                    getResultColor: calc.getResultColor(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class Calculate extends StatelessWidget {
  final Function()? route;
  final String? label;

  Calculate({
    required this.route,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: route,
      child: Container(
        width: double.infinity,
        height: KBottomConatinerHeight,
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          color: bottomContainColor,
        ),
        child: Align(
          child: Text(
            '$label',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
