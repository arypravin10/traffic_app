import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:traffic_simulator/inputTextWidget.dart';
import 'LoginScreen.dart';



class ForgotPassword extends StatefulWidget {
  ForgotPassword() : super();

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Segoe UI',
              fontSize: 30,
              shadows: [
                Shadow(
                  color: const Color(0xba000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            )),
        //centerTitle: true,
        leading: InkWell(
          onTap: () => Get.to(LoginScreen()),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,

            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: screenWidth,
          height: screenHeight,
          child: SingleChildScrollView(
            //controller: controller,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Find Your Account',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff000000),

                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  InputTextWidget(
                      labelText: "Enter your email address",
                      icon: Icons.email,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: 12.0,
                  ),
    SizedBox(
    height: 15.0,
    ),
    Container(
    height: 55.0,
    child: ElevatedButton(
    onPressed: () async {
    if (_formKey.currentState!.validate()) {}
    },
    style: ElevatedButton.styleFrom(
    primary: Colors.white,
    elevation: 0.0,
    minimumSize: Size(screenWidth, 150),
    padding: EdgeInsets.symmetric(horizontal: 30),
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(0)),
    ),
    ),
    child: Ink(
    decoration: BoxDecoration(
    boxShadow: <BoxShadow>[
    BoxShadow(
    color: Color(0xfff05945),
    offset: const Offset(1.1, 1.1),
    blurRadius: 10.0),
    ],
    color: Color(0xffF05945),
    borderRadius: BorderRadius.circular(12.0)),
              child: Container(
                alignment: Alignment.center,
                          child: Text(
                            "Continue",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 25),

                        ),
                      ),
                    ),
                  ),

              ),
  ],
      ),
    ),
    ),
      ),
    ),

    );
  }
}
