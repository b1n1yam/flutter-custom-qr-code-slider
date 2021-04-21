import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final String name;
  final Color color;
  final Function callback;
  double fontSize;
  double radius = 10;
  NextButton(
      {@required this.name,
      @required this.color,
      @required this.callback,
      this.fontSize = 0,
      this.radius = 10});
  @override
  Widget build(BuildContext context) {
    if (fontSize == 0) fontSize = MediaQuery.of(context).size.width * .05;
    // TODO: implement build
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: color,
        primary: color,
        minimumSize: Size(88, 36),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
      ),
      child: new Text(
        name,
        style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w700),
      ),
      onPressed: () => callback(),
    );
  }
}
