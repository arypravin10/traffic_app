import 'package:flutter/material.dart';
import 'package:traffic_simulator/homescreen.dart';
import 'package:traffic_simulator/signUpScreen.dart';
import 'package:traffic_simulator/inputTextWidget.dart';
import 'package:traffic_simulator/forgotPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:traffic_simulator/inputTextWidget.dart';
import 'package:get/get.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen() : super();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<LoginScreen> {
  final TextEditingController _pwdController = TextEditingController();

  bool showProgress = false;
  final TextEditingController _emailController = TextEditingController();
  final snackBar = SnackBar(content: Text('email or password is incorrect'));
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double r = (175 / 360); //  rapport for web test(304 / 540);
    final coverHeight = screenWidth * r;
    bool _pinned = false;
    bool _snap = false;
    bool _floating = false;

    final widgetList = [
      Row(
        children: [
          SizedBox(
            width: 28,
          ),
          Text(
            'Welcome to Login',
            
            style: TextStyle(
              
              fontFamily: 'Open Sans',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 56, 50, 50),
              
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      SizedBox(
        height: 12.0,
      ),
      Form(
          key: _formKey,
          child: Column(
            children: [
              InputTextWidget(
                  controller: _emailController,
                  labelText: "email ",
                  icon: Icons.email,
                  
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress),
              SizedBox(
                height: 12.0,
              ),
              InputTextWidget(
                  controller: _pwdController,
                  labelText: "password",
                  icon: Icons.lock,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress),
              Padding(
                padding: const EdgeInsets.only(right: 25.0, top: 10.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: ()
                        {print
                          ("forgot password clicked");
                        Get.to(ForgotPassword());
                        },
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 55.0,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => homepage(),));
                    }
                    //Get.to(ChoiceScreen());
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
                              color: Color.fromARGB(255, 27, 11, 10),
                              offset: const Offset(1.1, 1.1),
                              blurRadius: 10.0),
                        ],
                        color: Color.fromARGB(255, 12, 51, 109), // Color(0xffF05945),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
      SizedBox(
        height: 15.0,
      ),
      Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 10.0, top: 15.0),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey, //Color(0xfff05945),
                        offset: const Offset(0, 0),
                        blurRadius: 5.0),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)),
              width: (screenWidth / 2) - 40,
              height: 55,
              child: Material(
                borderRadius: BorderRadius.circular(12.0),
                child: InkWell(
                  onTap: () {
                    print("facebook tapped");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.facebook),
                        SizedBox(
                          width: 7.0,
                        ),
                        Text("Sign in with\nFacebook")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 30.0, top: 15.0),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey, //Color(0xfff05945),
                        offset: const Offset(0, 0),
                        blurRadius: 5.0),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)),
              width: (screenWidth / 2) - 40,
              height: 55,
              child: Material(
                borderRadius: BorderRadius.circular(12.0),
                child: InkWell(
                  onTap: () {
                    print("google tapped");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                       Icon(Icons.web),
                        SizedBox(
                          width: 7.0,
                        ),
                        Text("Sign in with\nGoogle")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 15.0,
      ),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: coverHeight - 25, //304,
            backgroundColor: Color(0xFFdccdb4),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background:
                  Image.asset("assets/trafficways.png", fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                     
                      ),
                  gradient: LinearGradient(
                      colors: <Color>[Color(0xFFdccdb4), Color(0xFFd8c3ab)])
                  
                  ),
              width: screenWidth,
              height: 25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: screenWidth,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return widgetList[index];
          }, childCount: widgetList.length))
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          new Container(
            height: 50.0,
            color: Colors.white,
            child: Center(
                child: Wrap(
              children: [
                Text(
                  "Don't have an Account?  ",
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                ),
                Material(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                )),
              ],
            )),
          ),
        ],
      ),
    );
  }
}