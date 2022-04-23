import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:traffic_simulator/LoginScreen.dart';



class ForgotPassword extends StatefulWidget {
  ForgotPassword() : super();

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  // for validating form field the user entered such as email or password
  final _formKey = GlobalKey<FormState>();

  // for tracking the changes to those text fields
  var email='';

  final TextEditingController _emailController = TextEditingController();

  @override


    resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text).then((value) => LoginScreen());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Password Reset Email has been sent !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'No user found for that email.',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    }
  }

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password",
            style: TextStyle(
              color: Color.fromARGB(255, 233, 232, 232),
              fontFamily: 'Roboto',
              fontSize: 25,
              shadows: [
                Shadow(
                  color: const Color(0xba000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
                
              ],
              
            ),
            ),
        //centerTitle: true,
          backgroundColor: Colors.green,

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
              child: Padding(padding: EdgeInsets.all(20),
              child:
              Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Find your account here',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff000000),

                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                       
                      labelText: "Enter your email address",
                      icon: Icon(Icons.email),
                      ),
                      validator: (value){
                        if (value ==null || value.isEmpty){
                          print('Please enter your email');
                        }
                        else if (!value.contains('@')){
                          print('Please enter a valid email');

                        }
                        else{
                          value=email;
                        }
                        return null;
                      },
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
    if (_formKey.currentState!.validate()) {
      resetPassword();
    }
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
     color: Color(0xffF05945),
    borderRadius: BorderRadius.circular(12.0)),
              child: Container(
                alignment: Alignment.center,
                          child: Text(
                            "Continue",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 15),

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
      ),

    );
  }
}

