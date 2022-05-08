import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

import 'pict_slide.dart';
import 'time_date.dart';
import 'drawer.dart';
import 'dart:ui';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

   @override
  void initState() {
    super.initState();
  }

  int index=0;

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: My_drawer(),
      appBar: AppBar(
        title: Text('Traffic Simulator '),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 243, 245, 248),

// For the bottom navigation bar

      // bottomNavigationBar: Row(
      //   children: [
      //     Container(
          
      //       height: 50,
      //       width: MediaQuery.of(context).size.width / 4,
      //       /*for 4 icons to be inserted*/
      //       decoration:
      //           BoxDecoration(color: Color.fromARGB(255, 244, 246, 247)),
      //       child: Icon(
            
      //         Icons.settings,
      //         size: 30,
      //       ),
      //     ),
      //     Container(
      //       height: 50,
      //       width: MediaQuery.of(context).size.width / 4,
      //       /*for 4 icons to be inserted*/
      //       decoration:
      //           BoxDecoration(color: Color.fromARGB(255, 244, 246, 247)),
      //       child: Icon(
      //         Icons.home,
      //         size: 30,
      //       ),
      //     ),
      //     Container(
      //       height: 50,
      //       width: MediaQuery.of(context).size.width / 4,
      //       decoration:
      //           BoxDecoration(color: Color.fromARGB(255, 244, 246, 247)),
      //       child: Icon(
      //         Icons.search,
      //         size: 30,
      //       ),
      //     ),
      //     Container(
      //       height: 50,
      //       width: MediaQuery.of(context).size.width / 4,
      //       decoration:
      //           BoxDecoration(color: Color.fromARGB(255, 244, 246, 247)),
      //       child: Icon(
      //         Icons.person,
      //         size: 30,
      //       ),
      //     ),
      //   ],
      // ),

      bottomNavigationBar:NavigationBarTheme(data: NavigationBarThemeData(indicatorColor: Color.fromARGB(255, 64, 80, 133),
      labelTextStyle: MaterialStateProperty.all(TextStyle(fontSize: 12,fontWeight: FontWeight.w600))),
      
      child:
       NavigationBar(
         height: 60,
         selectedIndex: index,
         onDestinationSelected:(index)=>setState(() => this.index=index) ,

         destinations: const [
       NavigationDestination(
         icon: Icon(Icons.person), label: 'Profile'),
       NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
      NavigationDestination(icon: Icon(Icons.notification_add), label: 'Notifications'),
      NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),

      ],
       )
      ),

      // For the centre body part

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              Container(
                
                height: 40,
                  child: ElevatedButton(
                    
                onPressed: () async {
                  await LaunchApp.openApp(
                    androidPackageName: 'com.example.mapbox_turn_by_turn',
                    openStore: true
                  );
                },
                child: Text('Go to Map',style: TextStyle(color: Colors.red),),
                
                
              )),

              SizedBox(
                height: 10,
              ),

              Container(
                child: date_time(),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: picture_slider(),
              ),

              // Container(
              //   height: 220,
              //   width: 400,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       gradient: LinearGradient(colors: [
              //         Color.fromRGBO(30, 40, 50, 0.2),
              //         Color.fromRGBO(10, 20, 255, 0.8)
              //       ], begin: Alignment.centerRight, end: Alignment.topLeft),
              //       image: DecorationImage(
              //         image: AssetImage('assets/nepal.jpg'),
              //         // fit: BoxFit
              //         //     .cover, /*fits the image to the fullest fill stretchs while cover zooms*/
              //         fit: BoxFit.fill,
              //       ),
              //     ),
              //   ),
              // ),

              SizedBox(height: 15),

              Container(
                child: ListTile(
                  title: Text("Let's get started with these features"),
                  textColor: Colors.blue,
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 25, sigmaY: 45),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(244, 246, 248, 248),
                          Color.fromARGB(237, 249, 248, 250),
                        ], begin: Alignment.topLeft, end: Alignment.topRight),
                      ),
                      height: 250,
                      width: 300,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            GridView.count(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              crossAxisCount: 3,
                              children: <Widget>[
                                // Card(
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(25)),
                                //   child: Column(
                                //     children: [
                                //       Container(
                                //         child: Icon(
                                //           Icons.traffic,
                                //           size: 40,
                                //         ),
                                //       ),
                                //       Container(
                                //         child: RaisedButton(
                                //           onPressed: () {
                                //             Navigator.push(
                                //                 context,
                                //                 MaterialPageRoute(
                                //                     builder: (context) =>
                                //                         News_page(),),);
                                //           },
                                //           child: Text(
                                //             'Traffic \n News',
                                //             style: new TextStyle(
                                //                 // fontWeight: FontWeight.bold,
                                //                 fontSize: 15.0,
                                //                 color: Colors.blue),
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // Card(
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(25)),
                                //   child: Column(
                                //     children: [
                                //       Container(
                                //         child: Icon(
                                //           Icons.traffic,
                                //           size: 40,
                                //         ),
                                //       ),
                                //       Container(
                                //         child: Text(
                                //           'Traffic \n Rules',
                                //           style: new TextStyle(
                                //               // fontWeight: FontWeight.bold,
                                //               fontSize: 15.0,
                                //               color: Colors.blue),
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // ),
                                // Card(
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(25)),
                                //   child: Column(
                                //     children: [
                                //       Container(
                                //         child: Icon(
                                //           Icons.local_police,
                                //           size: 40,
                                //         ),
                                //       ),
                                //       Container(
                                //         child: Text(
                                //           'Traffic \n Stations',
                                //           style: new TextStyle(
                                //               // fontWeight: FontWeight.bold,
                                //               fontSize: 15.0,
                                //               color: Colors.blue),
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // ),
                                // Card(
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(25)),
                                //   child: Column(
                                //     children: [
                                //       Container(
                                //         child: Icon(
                                //           Icons.local_parking,
                                //           size: 40,
                                //         ),
                                //       ),
                                //       Container(
                                //         child: Text(
                                //           'Parking \n Areas',
                                //           style: new TextStyle(
                                //               // fontWeight: FontWeight.bold,
                                //               fontSize: 15.0,
                                //               color: Colors.blue),
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // ),
                                // Card(
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(25)),
                                //   child: Column(
                                //     children: [
                                //       Container(
                                //         child: Icon(
                                //           Icons.ev_station,
                                //           size: 40,
                                //         ),
                                //       ),
                                //       Container(
                                //         child: Text(
                                //           ' Fuel \n Station',
                                //           style: new TextStyle(
                                //               // fontWeight: FontWeight.bold,
                                //               fontSize: 15.0,
                                //               color: Colors.blue),
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // ),

                                Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: EdgeInsets.all(4.5),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white),
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              Traffic_news())));
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Icon(
                                                        Icons.traffic,
                                                        color: Colors.black,
                                                        size: 40,
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        'Traffic News',
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),

                                Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: EdgeInsets.all(3.5),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white),
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              Traffic_rules())));
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Icon(
                                                        Icons.traffic,
                                                        color: Colors.black,
                                                        size: 42,
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        'Traffic Rules',
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),

                                Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: EdgeInsets.all(2.5),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white),
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              Traffic_stations())));
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Icon(
                                                        Icons.local_police,
                                                        color: Colors.black,
                                                        size: 43,
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        'Traffic Station',
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),

                                Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: EdgeInsets.all(1.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white),
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              Parking_areas())));
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Icon(
                                                        Icons.local_parking,
                                                        color: Colors.black,
                                                        size: 43,
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        'Parking Areas',
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),

                                Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: EdgeInsets.all(2.1),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white),
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              Fuel_station())));
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Icon(
                                                        Icons.ev_station,
                                                        color: Colors.black,
                                                        size: 42,
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        'Fuel Station',
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),

                                Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: EdgeInsets.all(1.5),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white),
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              Places_to_visit())));
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Icon(
                                                        Icons.place,
                                                        color: Colors.black,
                                                        size: 44,
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        'Places\nto Visit',
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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

// for traffic news

class Traffic_news extends StatelessWidget {
  const Traffic_news({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("News").snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              print("Total documents :${snapshot.data!.docs.length}");
              if (snapshot.data!.docs.isNotEmpty) {
                return ListView.separated(
                  itemBuilder: (__, int index) {
                    Map<String, dynamic> docData =
                        snapshot.data!.docs[index].data();
                    if (docData.isEmpty) {
                      return SizedBox(
                        child: Text(
                          "Document is empty",
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    String image =
                        snapshot.data!.docs.elementAt(index).get("image");
                    String heading =
                        snapshot.data!.docs.elementAt(index).get("heading");
                    String message =
                        snapshot.data!.docs.elementAt(index).get("message");
                   
                    return Container(
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(
                                      heading,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 180,
                                      width: 360,
                                      child: Image.network(
                                        image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(height:20),
                                    Text(message),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  
                                  ],
                                ))));
                  },
                  separatorBuilder: (__, ___) {
                    return Divider();
                  },
                  itemCount: snapshot.data!.docs.length,
                );
              } else {
                return const Center(
                  child: Text("Document not available"),
                );
              }
            } else {
              return const Center(
                child: Text("Getting error"),
              );
            }
          }),
    );
  }
}

mixin Firestore {
  static var instance;
}

// for traffic rules

class Traffic_rules extends StatelessWidget {
  const Traffic_rules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traffic Rules'),
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("t_rules").snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              print("Total documents :${snapshot.data!.docs.length}");
              if (snapshot.data!.docs.isNotEmpty) {
                return ListView.separated(
                  itemBuilder: (__, int index) {
                    Map<String, dynamic> docData =
                        snapshot.data!.docs[index].data();
                    if (docData.isEmpty) {
                      return SizedBox(
                        child: Text(
                          "Document is empty",
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    String image =
                        snapshot.data!.docs.elementAt(index).get("image");
                    String heading =
                        snapshot.data!.docs.elementAt(index).get("heading");
                    String message =
                        snapshot.data!.docs.elementAt(index).get("message");
                     

                    return Container(
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 90,
                                      child: Image.network(
                                        image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Container(
                                      child: Center(child:
                                      Column(
                                        children: [
                                          Text(
                                            heading,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.red),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(message),
                                            Text(message),
                                    
                                        ],
                                      ),
                                    )
                                    )
                                  ],
                                ))));
                  },
                  separatorBuilder: (__, ___) {
                    return Divider();
                  },
                  itemCount: snapshot.data!.docs.length,
                );
              } else {
                return const Center(
                  child: Text("Document not available"),
                );
              }
            } else {
              return const Center(
                child: Text("Getting error"),
              );
            }
          }),
    );
  }
}

// for traffic stations

class Traffic_stations extends StatelessWidget {
  const Traffic_stations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traffic Stations'),
        backgroundColor: Colors.grey,
      ),
    );
  }
}

class Parking_areas extends StatelessWidget {
  const Parking_areas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Areas For Parking'),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

// for fuel stations

class Fuel_station extends StatelessWidget {
  const Fuel_station({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fuel Stations'),
        backgroundColor: Colors.brown,
      ),
    );
  }
}

// for places to visit

class Places_to_visit extends StatelessWidget {
  const Places_to_visit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Places to Visit'),
      backgroundColor: Colors.green,
    ),
    body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("places_visit").snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              print("Total documents :${snapshot.data!.docs.length}");
              if (snapshot.data!.docs.isNotEmpty) {
                return ListView.separated(
                  itemBuilder: (__, int index) {
                    Map<String, dynamic> docData =
                        snapshot.data!.docs[index].data();
                    if (docData.isEmpty) {
                      return SizedBox(
                        child: Text(
                          "Document is empty",
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    String image =
                        snapshot.data!.docs.elementAt(index).get("image");
                    String heading =
                        snapshot.data!.docs.elementAt(index).get("heading");
                    String message =
                        snapshot.data!.docs.elementAt(index).get("message");

                    String  others_info =
                        snapshot.data!.docs.elementAt(index).get("others_info",);


                    return Container(
                      color: Color.fromARGB(255, 226, 225, 225),
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(
                                      heading,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 180,
                                      width: 360,
                                      child: Image.network(
                                        image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(message),
                                    SizedBox(height: 10,),

                                   Container(
                                     color: Color.fromARGB(255, 231, 200, 227),
                                      height: 100,
                                      width: 360,
                                      child:Text(others_info),
                                       ),
                                                                      ],
                                ))));
                  },
                  separatorBuilder: (__, ___) {
                    return Divider();
                  },
                  itemCount: snapshot.data!.docs.length,
                );
              } else {
                return const Center(
                  child: Text("Document not available"),
                );
              }
            } else {
              return const Center(
                child: Text("Getting error"),
              );
            }
          }),
    );
  }
}
