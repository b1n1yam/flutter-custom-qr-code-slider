import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';
import 'package:qr_demo/recipentBody.dart';
import 'package:qr_demo/recipentDetail.dart';
import 'package:qr_demo/recipentFooter.dart';
import 'package:qr_demo/separator.dart';
import 'package:qr_demo/transactionModel.dart';
import 'package:slider_button/slider_button.dart';

///this file contains the logic of
///showing and saving cinema ticket
class PaymentConfirmation extends StatefulWidget {
  TransactionModel transaction;
  String amount;
  PaymentConfirmation({Key key, @required this.transaction, this.amount})
      : super(key: key);
  @override
  _PaymentConfirmationState createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends State<PaymentConfirmation> {
  GlobalKey _globalKey = new GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool loading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          title: const Text('Confirm Payment'),
          leading: Container(
            width: MediaQuery.of(context).size.width * .12,
            height: MediaQuery.of(context).size.width * .12,
            child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 28.0,
                ),
                onPressed: () {}),
          )),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Color(0xFFECEFF1),
              Color(0xFFF5F5F5),
            ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                tileMode: TileMode.clamp)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: RepaintBoundary(
              key: _globalKey,
              child: Center(
                child: FlutterTicketWidget(
                  width: 350.0,
                  height: 450.0,
                  isCornerRounded: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(20.0),
                            topRight: const Radius.circular(20.0),
                          ),
                          color: Colors.blue,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              ticketDetailsWidget(
                                'Address',
                                '${widget.transaction.address}',
                              ),
                              SizedBox(height: 4),
                              ticketDetailsWidget(
                                'Phone number',
                                '${widget.transaction.contact}',
                              ),
                              SizedBox(height: 4),
                              ticketDetailsWidget(
                                'TIN',
                                '${widget.transaction.tin}',
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            recipentBody(
                              'date',
                              "Wed-04-2021 at 1:30PM",
                            ),
                            SizedBox(height: 4),
                            recipentBody(
                              'invoice number',
                              '745121124411',
                            ),
                            SizedBox(height: 4),
                            recipentBody(
                              'service',
                              "purchase",
                            ),
                          ],
                        ),
                      )),
                      SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: MySeparator(color: Colors.grey),
                      ),
                      SizedBox(height: 15),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            recipentBody(
                              'beneficiary',
                              '${widget.transaction.contact}',
                            ),
                            SizedBox(height: 4),
                            recipentBody(
                              'name',
                              '${widget.transaction.name}',
                            ),
                          ],
                        ),
                      )),
                      SizedBox(height: 35),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: MySeparator(color: Colors.grey),
                      ),
                      SizedBox(height: 7),
                      SizedBox(height: 7),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            right: 15, left: 15, top: 15, bottom: 35),
                        child: Column(
                          children: [
                            recipentBody(
                              'amount',
                              '${widget.amount}br',
                            ),
                            SizedBox(height: 4),
                            recipentBody(
                              'transaction fee',
                              '5 br',
                            ),
                            SizedBox(height: 8),
                            recipentFooter(
                              'total',
                              '${int.parse(widget.amount) + 5}br',
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SliderButton(
                    action: () {
                      ///Do something here
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
                    height: 60,
                    buttonSize: 54,
                    radius: 25,
                    baseColor: Colors.white,
                    backgroundColor: Color(0xff99B9EE),
                    highlightedColor: Colors.black,
                    boxShadow:
                        BoxShadow(blurRadius: 4, color: Color(0xffC5D6F1)),
                    buttonColor: Theme.of(context).primaryColor,
                    dismissible: false),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
