import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_demo/qr_result_bottom_sheet.dart';
import 'package:qr_demo/transactionModel.dart';
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
  List<TransactionModel> _merchants = List<TransactionModel>();

  String qr;
  bool camState = true;
  bool loaded = true;

  @override
  initState() {
    fetchMerchants().then((value) {
      print("hellloooo nickolas cage");
      print(value);
      _merchants = value;
    });

    super.initState();
  }

  Future<List<TransactionModel>> fetchMerchants() async {
    var merchants = List<TransactionModel>();
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/mock/fakeBackend.json");
    final jsonResult = json.decode(data);
    for (var results in jsonResult) {
      merchants.add(TransactionModel.fromJson(results));
    }
    return merchants;
  }

  void change() {
    setState(() {
      loaded = true;
    });
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
                                  print(code);

                                  if (loaded) {
                                    setState(() {
                                      loaded = false;
                                    });
                                    for (var mer in _merchants) {
                                      if (mer == code) {
                                        //correcto arigato
                                      } else {
                                        //throw error
                                      }
                                    }
                                    //check if qr code is valid

                                  }
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavResults()));
                    },
                    label: Text(
                      "SLIDE TO PAY",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    icon: Center(
                        child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 30.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    )),
                    radius: 10,
                    baseColor: Colors.white,
                    backgroundColor: Color(0xff99B9EE),
                    highlightedColor: Colors.black,
                    buttonColor: Theme.of(context).primaryColor,
                    dismissible: false)),
          ],
        ),
      ),
    );
  }

  // void bottomSheetResult(context) {
  //   showModalBottomSheet<dynamic>(
  //       context: context,
  //       backgroundColor: Colors.transparent,
  //       isScrollControlled: true,
  //       builder: (ctx) => Padding(
  //             padding: MediaQuery.of(context).viewInsets,
  //             child: BottomNavResults(
  //               hjj: change,
  //             ),
  //           )).whenComplete(() => change());
  // }
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
