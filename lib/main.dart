import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traffic App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traffic Simulator '),
      ),
      backgroundColor: Color.fromARGB(255, 248, 246, 246),

// For the bottom navigation bar

      bottomNavigationBar: Row(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 4,
            /*for 4 icons to be inserted*/
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 244, 246, 247)),
            child: Icon(
              Icons.settings,
              size: 30,
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 4,
            /*for 4 icons to be inserted*/
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 244, 246, 247)),
            child: Icon(
              Icons.home,
              size: 30,
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 4,
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 244, 246, 247)),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 4,
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 244, 246, 247)),
            child: Icon(
              Icons.person,
              size: 30,
            ),
          ),
        ],
      ),

      // For the centre body part

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              Container(
                
                  
                 
                    
                    child: date_time (),
                  
                
              ),

              SizedBox(height: 10,),

              Container(
                height: 220,
                width: 400,
                color: Color.fromARGB(255, 197, 196, 196),
                child: Container(
                  child: Image(
                    image: AssetImage('assets/nepal.jpg'),
                    fit: BoxFit
                        .cover, /*fits the image to the fullest fill stretchs while cover zooms*/
                  ),
                ),
              ),
              SizedBox(height: 15),
              
              Container(
                child: ListTile(
                  title: Text("Let's get started with these features"),
                  textColor: Colors.blue,
                ),
              ),
              Container(
                height: 250,
                width: 300,
                color: Color.fromARGB(255, 239, 244, 247),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      GridView.count(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        crossAxisCount: 3,
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('assets/news.png'),
                                            fit: BoxFit.fill)),
                                  ),
                                  Container(
                                    child: Text("Traffic \n News"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text("Traffic \n Rules"),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text("Police \n Stations"),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text("Parking \n Areas"),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text("Fuel \n Stations"),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text("Places \n to Visit"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class date_time extends StatelessWidget {
 @override
Widget build(BuildContext context) {
DateTime now = DateTime.now(); 
String formattedDate = DateFormat('MMM d EEE         kk:mm:ss ').format(now);
return Container(
  
          child:Center(child: Text(formattedDate,textAlign: TextAlign.center,style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)
          ),),);
        
}
}