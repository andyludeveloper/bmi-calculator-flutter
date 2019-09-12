import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kLargeLabelTextStyle,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: kActiveCardColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('OVERWEIGHT', style:kGreenLabelTextStyle),
                Text('20.0', style:kLargeLabelTextStyle),
                Text('You have a higher than normal body weight. Try to exercise more.')
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
              color: Colors.red,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomBarHeight,
            ),
          )
        ],
      ),
    );
  }
}
