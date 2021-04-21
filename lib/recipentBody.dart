import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget recipentBody(String firstTitle, String secondTitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: TextStyle(color: Colors.black, fontSize: 13),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              secondTitle,
              style: TextStyle(color: Colors.black38, fontSize: 12),
            ),
          ],
        ),
      )
    ],
  );
}
