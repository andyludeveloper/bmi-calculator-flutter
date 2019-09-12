import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import '../components/round_icon_button.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'result_page.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.MALE;
  int height = 150;
  int weight = 80;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    var row1 = Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              color: selectedGender == Gender.MALE
                  ? kActiveCardColor
                  : kInactiveCardColor,
              cardChild: IconContent(
                iconData: FontAwesomeIcons.mars,
                title: "MALE",
              ),
              itemSelected: maleSelected,
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: selectedGender == Gender.FEMALE
                  ? kActiveCardColor
                  : kInactiveCardColor,
              cardChild: IconContent(
                  iconData: FontAwesomeIcons.venus, title: "FEMALE"),
              itemSelected: femaleSelected,
            ),
          ),
        ],
      ),
    );

    var row2 = ReusableCard(
      color: kActiveCardColor,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'HEIGHT',
            style: kLabelTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                height.toString(),
                style: kLargeLabelTextStyle,
              ),
              Text(
                'cm',
                style: kLabelTextStyle,
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: Color(0xFF8D8E98),
                thumbColor: Color(0xFFEB1555),
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 15.0,
                ),
                overlayColor: Color(0x29EB1555),
                overlayShape: RoundSliderOverlayShape(
                  overlayRadius: 30.0,
                )),
            child: Slider(
              value: height.toDouble(),
              min: 120.0,
              max: 220.0,
              onChanged: (double newValue) {
                setState(() {
                  print(newValue);
                  height = newValue.round();
                });
              },
            ),
          )
        ],
      ),
    );

    var row3 = Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'WEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Text(
                    weight.toString(),
                    style: kLargeLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        pressedCallback: () {
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                      SizedBox(width: 5.0),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        pressedCallback: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'AGE',
                    style: kLabelTextStyle,
                  ),
                  Text(
                    age.toString(),
                    style: kLargeLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        pressedCallback: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                      SizedBox(width: 5.0),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        pressedCallback: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          row1,
          Expanded(
            child: row2,
          ),
          Expanded(
            child: row3,
          ),
          BottomButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(),
                ),
              );
            },
            title: 'CALCULATION',
          ),
        ],
      ),
    );
  }

  void maleSelected() {
    genderSelected(Gender.MALE);
  }

  void femaleSelected() {
    genderSelected(Gender.FEMALE);
  }

  void genderSelected(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }
}
