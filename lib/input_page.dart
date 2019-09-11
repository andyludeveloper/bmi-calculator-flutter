import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.MALE;
  int height = 150;
  final row3 = Container(
    child: Row(
      children: <Widget>[
        Expanded(
          child: ReusableCard(color: kActiveCardColor),
        ),
        Expanded(
          child: ReusableCard(color: kActiveCardColor),
        ),
      ],
    ),
  );

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
              style:kLargeLabelTextStyle,
            ),
            Text(
              'cm',
              style:kLabelTextStyle,
            ),
          ],
          ),
          Slider(
            value: height.toDouble(),
            min: 120.0,
            max: 220.0,
            activeColor: Color(0xFFEB1555),
            inactiveColor: Color(0xFF8D8E98),
            onChanged:(double newValue){
              setState(() {
                print(newValue);
                height = newValue.round();
              });
            },
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
          Container(
            color: Colors.red,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomBarHeight,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
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
