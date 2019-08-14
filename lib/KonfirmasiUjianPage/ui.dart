import 'package:flutter/material.dart';

import '../FormBiodataPage/ui.dart';

class KonfirmasiUjianPage extends StatefulWidget {
  @override
  _KonfirmasiUjianPageState createState() => _KonfirmasiUjianPageState();
}

class _KonfirmasiUjianPageState extends State<KonfirmasiUjianPage> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.blueAccent,
              Colors.blue,
              Colors.lightBlue
            ]
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Container(
                child: new Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Expanded(
                              child: new Text(
                                  "PT. Ekrutes Indonesia",
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "RedHatDisplay",
                                  fontSize: 15
                                ),
                              ),
                            ),
                            new Expanded(
                              child: new Image.asset(
                                'assets/logo.png',
                                height: 50,
                              )
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),

              new Container(
                child: new Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "Rekrutmen Staff Ekrutes 2019",
                          style: new TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new SizedBox(
                            width: 250,
                            height: .8,
                            child: new Container(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Expanded(
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Icon(
                                      Icons.calendar_today,
                                    color: Colors.red,
                                  ),
                                  new Text(
                                      "Senin, 25-Oktober-2019",
                                    style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      fontSize: 9
                                    ),
                                  )
                                ],
                              )
                            ),
                            new Expanded(
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.access_time,
                                      color: Colors.red,
                                    ),
                                    new Text(
                                      "08.00-13.00",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                          fontSize: 9
                                      ),
                                    )
                                  ],
                                )
                            ),
                            new Expanded(
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                    ),
                                    new Text(
                                      "Jl Padjadjaran 5 No.124, Kota Bandung",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                        fontSize: 9
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              RaisedButton(
                elevation: 12,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text(
                          "Lanjutkan pengisian Biodata ?",
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: new Text("Pastikan nama ujian telah sesuai"),
                        actions: <Widget>[
                          new RaisedButton(
                            elevation: 10,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            color: Colors.green,
                            child: new Text(
                                "Lanjutkan",
                              style: new TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            onPressed: ()=>Navigator.push(context,
                            new MaterialPageRoute(
                              builder: (context)=>new FormBiodataPage()
                            )),
                          ),
                          new RaisedButton(
                            elevation: 10,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            color: Colors.redAccent,
                            child: new Text(
                              "Batal",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            onPressed: ()=>Navigator.pop(context),
                          )
                        ],
                      );
                    }
                  );
                },
                child: Text(
                  "Bersiap Ujian",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              )

            ],
          ),
        )
      ),
    );
  }
}
