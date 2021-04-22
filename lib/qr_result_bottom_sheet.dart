import 'package:flutter/material.dart';
import 'package:qr_demo/temp/ButtonLogin.dart';
import 'package:qr_demo/temp/colors.dart';
import 'package:qr_demo/transactionModel.dart';

import 'confirmation.dart';
import 'merchantDetail.dart';

class BottomNavResults extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();

  TransactionModel transaction;
  BottomNavResults({Key key, @required this.transaction}) : super(key: key);
  final Map<String, dynamic> _formData = {
    'amount': null,
  };

  Future<bool> _submitForm(context) async {
    if (!_formKey.currentState.validate()) {
      return false;
    }
    _formKey.currentState.save();

    String amount = _formData['amount'];
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PaymentConfirmation(amount: amount, transaction: transaction)));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Merchant detail'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          child: Stack(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: new Column(
                children: <Widget>[
                  Container(
                      color: Color(0x000000).withOpacity(0),
                      child: Container()),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              //Title

                              Container(
                                padding: EdgeInsets.only(top: 40, bottom: 30),
                                child: Text(
                                  transaction.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: CustomColors.primaryBlue,
                                      fontSize: 19),
                                ),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    merchantDetail(Icons.location_on, "Address",
                                        transaction.address),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    merchantDetail(Icons.paste_sharp, "TIN",
                                        transaction.tin),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    merchantDetail(
                                        Icons.phone, "Contact", "091-234-5678"),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    merchantDetail(Icons.category, "Category",
                                        transaction.category)
                                  ]),

                              Container(
                                padding: EdgeInsets.only(top: 30, bottom: 20),
                                child: Text(
                                  "Enter Amount to Pay",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                width: MediaQuery.of(context).size.width * 0.85,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: CustomColors.lightGrey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: TextFormField(
                                  controller: _amountController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Amount',
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (String value) {
                                    if (value.isEmpty ||
                                        !RegExp(r"[0-9]$").hasMatch(value)) {
                                      return 'Please enter a valid Amount';
                                    }
                                  },
                                  onSaved: (String value) {
                                    _formData['amount'] = value;
                                  },
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.only(
                                    left: 30,
                                    right: 30,
                                    top: MediaQuery.of(context).size.height *
                                        .05,
                                    bottom: 50),
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: NextButton(
                                    name: "Next",
                                    color: CustomColors.primaryBlue,
                                    callback: () => _submitForm(context)),
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              child: Container(
                  width: 80,
                  height: 80,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Container(
                    height: 70,
                    child: CircleAvatar(
                      child: Image.network(
                        transaction.image,
                      ),
                      radius: 50.0,
                    ),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
