import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget merchantDetail(icon, String firstTitle, String secondTitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon,
              size: 13,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            SizedBox(width: 8),
            Text(
              firstTitle,
              style: TextStyle(color: Colors.black38, fontSize: 12),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 8),
        child: Align(
          alignment: Alignment.centerRight,
          child: Column(
            children: <Widget>[
              Text(
                secondTitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
