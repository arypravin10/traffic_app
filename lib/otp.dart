import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:traffic_simulator/signUpScreen.dart';

class otp extends StatefulWidget {
  const otp({Key? key}) : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  late EmailAuth emailAuth;

  @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "Traffic App",
    );
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  void verify() {
    var result=emailAuth.validateOtp(
        recipientMail: _emailController.value.text,
        userOtp: _otpController.value.text);

        if (result){
          print("'Verification successful");
           ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color.fromARGB(255, 80, 74, 74),
            content: Text(
              "OTP verified successfully.",
              style: TextStyle(fontSize: 10),
            ),
          ),
        );
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));

        }

        else{
          print("OTP not verified");
           ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color.fromARGB(255, 110, 108, 108),
            content: Text(
              "OTP not verified.",
              style: TextStyle(fontSize: 10),
            ),
          ),
        );
        }

  }

  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: _emailController.value.text, otpLength: 5);
    if (result) {

      print('Otp sent');
    } else if (!result) {
      print("Problem in sending otp");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Verify Email'),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/baudha.jpg',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          labelText: "Email",
                          suffixIcon: TextButton(
                              onPressed: () => sendOtp(),
                              child: Text('Send OTP')),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter your OTP",
                        labelText: "OTP",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    ElevatedButton(
                      
                        onPressed: () => verify(), 
                        child: const Text('Verify OTP'),
                        )
                        
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
