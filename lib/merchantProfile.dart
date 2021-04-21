import 'package:flutter/material.dart';
import 'package:qr_demo/temp/ButtonLogin.dart';
import 'package:qr_demo/temp/colors.dart';

class MerchantProfile extends StatefulWidget {
  @override
  _MerchantProfileState createState() => _MerchantProfileState();
}

class _MerchantProfileState extends State<MerchantProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: MediaQuery.of(context).size.height / 2 - 200,
          child: Container(
            padding: MediaQuery.of(context).viewInsets,
            height: 700,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
          ),
        ),
        Positioned(
          top: 130,
          left: 0,
          right: 0,
          child: Column(
            children: <Widget>[
              Container(
                width: 70,
                height: 70,
                child: Image.asset('assets/images/add.png'),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xffe3f2fd),
                      Colors.blue,
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                // key: _formKey,
                child: Column(
                  children: <Widget>[
                    //Title

                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 25),
                      child: Text(
                        "Abebe's Shop",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: CustomColors.primaryBlue,
                            fontSize: 19),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text(
                        "Enter Amount to Pay",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: CustomColors.lightGrey),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: TextFormField(
                        // controller: _amountController,
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
                          // _formData['amount'] = value;
                        },
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: MediaQuery.of(context).size.height * .1),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: NextButton(
                        name: "Next",
                        color: CustomColors.primaryBlue,
                        // callback: _submitForm),
                      ),
                    ),
                  ],
                ),
              )),
        )
      ],
    ));
  }
}
