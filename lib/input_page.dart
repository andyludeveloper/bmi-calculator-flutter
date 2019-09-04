import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomCardColor = Color(0XFFEB555);
enum Gender {
  MALE,
  FEMALE
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.MALE;

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
                        selectedGender = Gender.MALE;
                      });
                    },
                    child: ReusableCard(
                      color: selectedGender==Gender.MALE?activeCardColor:inactiveCardColor,
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
                        selectedGender = Gender.FEMALE;
                      });
                    },
                    child: ReusableCard(
                      color: selectedGender==Gender.FEMALE?activeCardColor:inactiveCardColor,
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
