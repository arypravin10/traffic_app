import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var email = "";
  var password = "";
  var confirmPassword = "";

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _name = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _pass.dispose();
    _confirmPass.dispose();
    super.dispose();
  }
    User? user = FirebaseAuth.instance.currentUser;



  registration() async {    
    if (password == confirmPassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "User registered Successfully.",
              style: TextStyle(fontSize: 10),
            ),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          print("Account Already exists");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        }
      }
    } else {
      return null;
    }
  }

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Sign Up",
            style: TextStyle(
              color: Color.fromARGB(255, 241, 235, 235),
              fontFamily: 'Segoe UI',
              fontSize: 20,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
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
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Welcome to Sign Up Page',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
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
                          decoration: const InputDecoration(
                            label: Text("Full Name"),
                            icon: Icon(Icons.person),
                          ),
                          controller: _name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              print('Enter some text');
                            }
                            return null;
                          },
                          obscureText: false,
                          keyboardType: TextInputType.text),
                      SizedBox(
                        height: 12.0,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            label: Text('Email Address'),
                            icon: Icon(Icons.email)),
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            print(
                              'the email field is empty',
                            );
                          } else if (!value.contains('@')) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: "Contact No",
                      //     icon: Icon(Icons.phone),
                      //   ),
                      //   obscureText: false,
                      //   keyboardType: TextInputType.number,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       print('the number field is empty');
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 12.0,
                      // ),
                      TextFormField(
                          obscureText: true,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                            ),
                            labelText: "Password",
                            hintText: '',
                            enabledBorder: InputBorder.none,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            border: InputBorder.none,
                          ),
                          controller: _pass,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'type a password ';
                            } else if (val.length < 6) {
                              return 'password must be of> 6 characters';
                            }

                            return null;
                          }),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                          obscureText: true,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                            ),
                            labelText: "Confirm Password",
                          ),
                          controller: _confirmPass,
                          validator: (val) {
                            if (val!.isEmpty) return 'confirm password!!';
                            if (val != _pass.text) return 'password incorrect';
                            return null;
                          }),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        height: 55.0,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                email = _emailController.text;
                                password = _pass.text;
                                confirmPassword = _confirmPass.text;
                              });
                              registration();

                         }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 0.0,
                            minimumSize: Size(screenWidth, 150),
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                            ),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromARGB(255, 201, 196, 195),
                                      offset: const Offset(1.1, 1.1),
                                      blurRadius: 10.0),
                                ],
                                color: Color.fromARGB(255, 37, 37, 37),
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Confirm",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
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
        ));
  }
}

