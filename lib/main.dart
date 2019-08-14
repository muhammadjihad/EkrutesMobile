import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './KonfirmasiUjianPage/ui.dart';

void main()=>runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Home(),
      theme: new ThemeData(
        pageTransitionsTheme: new PageTransitionsTheme(
          builders: {TargetPlatform.android:CupertinoPageTransitionsBuilder(),}
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  Future<void> nextPage()async{
    await Future.delayed(Duration(seconds: 4));
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => EntryPage(),
        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 1000),
      ),
    );
  }

  @override
  void initState() {
    this.nextPage();
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                begin: Alignment.bottomCenter,
                end:Alignment.topCenter,
                colors: [
                  Colors.lightBlue,
                  Colors.blue
                ]
            )
        ),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                "assets/logo.png",
                width: 100,
              ),
              new Text(
                "Ekrutes",
                style: new TextStyle(
                    fontSize: 60,
                    fontFamily: "RedHatDisplay",
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
              new Text(
                "One stop Recruitment App",
                style: new TextStyle(
                    color: Colors.white
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EntryPage extends StatefulWidget {
  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {

  Future<String> postUjian({kodeTes})async{
    http.Response data= await http.post(
      "http://172.16.17.132:8000/peserta-api/masuk-ujian/",
      body: {
        'kodeTes':kodeTes
      }
    );
    var json=jsonDecode(data.body);
    return json['message'];
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: ()async=>false,
      child: new Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin:Alignment.bottomRight,
              end: Alignment.topRight,
              colors: [
                Colors.blue,
                Colors.lightBlueAccent
              ]
            )
          ),
          child: new Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new TextField(
                    decoration: new InputDecoration(
                      prefixIcon: new Icon(
                          Icons.art_track,
                        color: Colors.white,
                      ),
                      labelText: "Masukkan Kode Ujian",
                      labelStyle: new TextStyle(
                        color: Colors.white,
                        fontSize: 17
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25),
                        borderSide: new BorderSide(
                          color: Colors.white,
                          width: 3.1
                        )
                      ),
                      enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                          borderSide: new BorderSide(
                              color: Colors.white,
                              width: 3.1
                          )
                      ),
                    ),
                    cursorColor: Colors.white,
                    style: new TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  new SizedBox(
                    height: 25,
                  ),
                  new FutureBuilder(
                    builder: (BuildContext context,i){
                      return RaisedButton(
                        elevation: 12,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: Colors.white,
                        onPressed: ()async {
                          print(await postUjian(kodeTes: "sdqdwqf"));
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context)=>KonfirmasiUjianPage()
                              )
                          );
                        },
                        child: Text(
                          "Masuk",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      );
                    }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
