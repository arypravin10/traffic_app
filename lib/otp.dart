
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:traffic_simulator/signUpScreen.dart';

class otp extends StatefulWidget {
  const otp({ Key? key }) : super(key: key);


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

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _otpController=TextEditingController();
   
   bool verify() {
    print(emailAuth.validateOtp(
        recipientMail: _emailController.value.text,
        userOtp: _otpController.value.text));
        
throw SignUpScreen();

        
        
  }

 void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: _emailController.value.text, otpLength: 5);
    if (result) {
      
      print('Otp sent');
    }
    else if(!result){
    print("problem in sending otp");
    }
  }
  



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify Email'),),

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:
      Column(
        children: [Image.asset('assets/baudha.jpg',fit: BoxFit.cover,),
        SizedBox(height: 10,),
        Padding(padding: const EdgeInsets.all(16),child: Column(
          children: [TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Enter your email",
              labelText: "Email",
              suffixIcon: TextButton(onPressed: ()=>sendOtp(), child: Text('Send OTP')
            ),
            )
          ),
          
          SizedBox(height: 10,),

         TextField(
           controller: _otpController,
           keyboardType: TextInputType.number,
           decoration: InputDecoration(
              hintText: "Enter your OTP",
              labelText: "OTP",
            ),
            ),
         SizedBox(height: 30,),

         ElevatedButton(onPressed: ()=>verify(), child: Text('Verify OTP'))
          
          ],

        ),),],
      ),
      )
    );

  }
}