import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomCardColor = Color(0XFFEB555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = activeCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateColor(int gender) {

    if (gender == 1) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      }
    } else if (gender == 0) {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      }
    }
  }

  final row2 = Container(
    child: Row(
      children: <Widget>[
        Expanded(
          child: ReusableCard(color: activeCardColor),
        ),
      ],
    ),
  );
  final row3 = Container(
    child: Row(
      children: <Widget>[
        Expanded(
          child: ReusableCard(color: activeCardColor),
        ),
        Expanded(
          child: ReusableCard(color: activeCardColor),
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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        print("tap1");
                        updateColor(1);
                      });
                    },
                    child: ReusableCard(
                      color: maleCardColor,
                      cardChild: IconContent(
                        iconData: FontAwesomeIcons.mars,
                        title: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        print("tap2");
                        updateColor(0);
                      });
                    },
                    child: ReusableCard(
                      color: femaleCardColor,
                      cardChild: IconContent(
                          iconData: FontAwesomeIcons.venus, title: "FEMALE"),
                    ),
                  ),
                ),
              ],
            ),
          );
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
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
            height: 30.0,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}
