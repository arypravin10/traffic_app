import 'package:flutter/material.dart';
import 'package:traffic_simulator/LoginScreen.dart';


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

          Divider(thickness: 10,),

          
          ListTile(
            onTap: (){},
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
            onTap: (){},
            leading: Icon(Icons.contact_phone),
            title: Text('Contact'),),

            Divider(thickness: 5,color: Colors.black,),

             ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),),
        ]),
        // backgroundColor: Colors.blueAccent,


      
    );
  }
}