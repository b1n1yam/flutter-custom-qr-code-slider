import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:slider_button/slider_button.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String qr;
  bool camState = true;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: camState
                    ? CustomPaint(
                        painter: MyCustomPaint(),
                        child: Center(
                          child: Container(
                            width: 300.0,
                            height: 300.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.blue,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: QrCamera(
                                fit: BoxFit.fitWidth,
                                onError: (context, error) => Text(
                                  error.toString(),
                                  style: TextStyle(color: Colors.red),
                                ),
                                qrCodeCallback: (code) {
                                  setState(() {
                                    qr = code;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(child: Text("Camera inactive"))),
            Center(
                child: SliderButton(
              action: () {
                ///Do something here
              },
              label: Text(
                "Slide to cancel Event",
                style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              icon: Text(
                "x",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 44,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class MyCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint()
      ..color = Color(0xFF2334D0)
      ..strokeWidth = 5.0;
    //the topleft horizonatal line
    Offset startingPoint = Offset(size.width * 0.045, size.height * 0.1);
    Offset endingPoint = Offset(size.width * 0.15, size.height * 0.1);

    canvas.drawLine(startingPoint, endingPoint, paint);

    //the topleft vertical line
    Offset startingPoint1 = Offset(size.width * 0.05, size.height * 0.1);
    Offset endingPoint2 = Offset(size.width * 0.05, size.height * 0.2);

    canvas.drawLine(startingPoint1, endingPoint2, paint);

    //the topright horizonatal line
    Offset startingPoint3 = Offset(size.width * 0.83, size.height * 0.1);
    Offset endingPoint3 = Offset(size.width * 0.94, size.height * 0.1);

    canvas.drawLine(startingPoint3, endingPoint3, paint);

    //the topright vertical line
    Offset startingPoint4 = Offset(size.width * 0.935, size.height * 0.1);
    Offset endingPoint4 = Offset(size.width * 0.935, size.height * 0.2);

    canvas.drawLine(startingPoint4, endingPoint4, paint);

    //the bottomleft horizonatal line
    Offset startingPoint5 = Offset(size.width * 0.045, size.height * 0.9);
    Offset endingPoint5 = Offset(size.width * 0.15, size.height * 0.9);

    canvas.drawLine(startingPoint5, endingPoint5, paint);

    //the bottomleft vertical line
    Offset startingPoint6 = Offset(size.width * 0.05, size.height * 0.8);
    Offset endingPoint6 = Offset(size.width * 0.05, size.height * 0.9);

    canvas.drawLine(startingPoint6, endingPoint6, paint);

    //the bottomright horizonatal line
    Offset startingPoint7 = Offset(size.width * 0.83, size.height * 0.9);
    Offset endingPoint7 = Offset(size.width * 0.94, size.height * 0.9);

    canvas.drawLine(startingPoint7, endingPoint7, paint);
//the bottom right vertical line
    Offset startingPoint8 = Offset(size.width * 0.935, size.height * 0.8);
    Offset endingPoint8 = Offset(size.width * 0.935, size.height * 0.9);

    canvas.drawLine(startingPoint8, endingPoint8, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
