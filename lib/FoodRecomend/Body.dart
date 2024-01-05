import 'package:CalorieMate/FoodRecomend/EachPic.dart';
import 'package:flutter/material.dart';

class Bodyy extends StatefulWidget {
  @override
  State<Bodyy> createState() => _BodyyState();
}

class _BodyyState extends State<Bodyy> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // EachPic(),
                      // EachPic(),
                      // EachPic(),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // EachPic(),
                      // EachPic(),
                      // EachPic(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
