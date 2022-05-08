import 'package:flutter/material.dart';
import 'package:traffic_simulator/LoginScreen.dart';
import 'package:traffic_simulator/homescreen.dart';


class My_drawer extends StatefulWidget {
  My_drawer({Key? key}) : super(key: key);

  @override
  State<My_drawer> createState() => _My_drawerState();
}

class _My_drawerState extends State<My_drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [

UserAccountsDrawerHeader(accountName: Text('YATRA'), accountEmail: Text('yatra@gmail.com'),
currentAccountPicture: CircleAvatar(child: ClipOval(
  child: Image.asset('assets/everest.jpg',width: 80,height: 80,fit: BoxFit.cover,),
),),
decoration: BoxDecoration(
  image: DecorationImage(image: AssetImage('assets/nepal.jpg'),fit: BoxFit.cover)
),
),

          
          ListTile(
            onTap: (){
              homepage();
            },
            leading: Icon(Icons.home,),
            title: Text('Home'),),

             ListTile(
            onTap: (){},
            leading: Icon(Icons.settings),
            title: Text('Settings'),),

             ListTile(
            onTap: (){},
            leading: Icon(Icons.info),
            title: Text('About us'),),

             ListTile(
            onTap: (){

Navigator.push(context, MaterialPageRoute(builder: (context) => contactpage(),));
              
            },
            leading: Icon(Icons.contact_phone),
            title: Text('Contact'),),

            Divider(thickness: 4,color: Colors.black,),

             ListTile(
            onTap: () async{
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),),
        ]),
        // backgroundColor: Colors.blueAccent,


      
    );
  }
}

//  for contact page

class contactpage extends StatelessWidget {
  const contactpage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("contact information"),),

      body: Container(
        child: Center(
          child:
        Column(
          children: [
            SizedBox(
              height: 10,
            ),
              Container(
                  height: 100,
                color: Color.fromARGB(255, 248, 248, 248),
                 
                      child:Center( child:Text('Pravin Aryal \n9817579922 \nFlutter Developer\nKathmandu,Nepal'),)),

                      SizedBox(height: 5,),

                        Container(
                  height: 100,
                color: Color.fromARGB(255, 248, 248, 248),
                 
                      child:Center( child:Text('Bishal Neupane \n9869042839 \nFlutter Developer\nKathmandu,Nepal'),)),
                     
                      SizedBox(height: 5,),

                        Container(
                  height: 100,
                color: Color.fromARGB(255, 248, 248, 248),
                 
                      child:Center( child:Text('Roshan Jaishi \n9812763413 \nFlutter Developer\nKathmandu,Nepal'),)),
                
          ],
        ),
        ),
      ),
      
    );
  }
}