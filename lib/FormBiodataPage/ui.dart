import 'package:flutter/material.dart';
import 'provider.dart';
import 'bloc.dart';

class FormBiodataPage extends StatefulWidget {

//  Initializing Provider and BLoC
  final FormBiodataProvider formBiodataProvider = new FormBiodataProvider();
  final FormBiodataBloc formBiodataBloc = new FormBiodataBloc();

  @override
  _FormBiodataPageState createState() => _FormBiodataPageState();
}

class _FormBiodataPageState extends State<FormBiodataPage> {

  DateTime date;
  TimeOfDay time;

  final TextEditingController namaDepanController = new TextEditingController();
  final TextEditingController namaBelakangController= new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController noKontakController = new TextEditingController();

  Future<void> getDate() async{
    final dateResult=await showDatePicker(
      context: context,
      initialDate:DateTime.now(),
      firstDate:DateTime(1965),
      lastDate:DateTime.now().add( Duration(days: 30)),
    );
    print(dateResult);
    setState(() {
      this.date=dateResult;
    });
  }

  Future<void> getTime() async{
    final timeResult=await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 5,minute: 20)
    );
    setState(() {
      this.time=timeResult;
    });
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Masukkan format email dengan benar';
    else
      return null;
  }

  String validateNama(String value){
    Pattern pattern=
        r'^([a-zA-Z]+)$';
    RegExp regex=new RegExp(pattern);
    if(!regex.hasMatch(value))
      return 'Hanya boleh menggunakan karakter';
    else
      return null;
  }

  List _jenisKelamin=[
    "Laki - Laki",
    "Perempuan"
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String pilihJenisKelamin;

  @override
  void initState() {
    _dropDownMenuItems=this.getDropDownMenuItems();
    pilihJenisKelamin=_jenisKelamin[0];
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems(){
    List<DropdownMenuItem<String>> items=new List();
    for(String jenisKelamin in this._jenisKelamin){
      items.add(
        new DropdownMenuItem(
          value: jenisKelamin,
          child: Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(jenisKelamin),
                new Icon(Icons.person)
              ],
            ),
          ),
        )
      );
    }
    return items;
  }

  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Colors.blueAccent,
              Colors.lightBlue
            ]
          )
        ),
        child: new Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Form(
              key: _formKey,
              child: new ListView(
                children: <Widget>[
                  new Text(
                    "Pengisian Biodata",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),

//                Masukkan nama depan dan nama belakang
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new TextFormField(
                      controller: namaDepanController,
                      validator: validateNama,
                      decoration: new InputDecoration(
                        prefixIcon: new Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        labelText: "Nama Depan",
                        labelStyle: new TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10),
                            borderSide: new BorderSide(
                                color: Colors.white,
                                width: 1
                            )
                        ),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10),
                            borderSide: new BorderSide(
                                color: Colors.white,
                                width: 1
                            )
                        ),
                      ),
                      cursorColor: Colors.white,
                      style: new TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new TextFormField(
                      validator: this.validateNama,
                      controller: namaBelakangController,
                      decoration: new InputDecoration(
                        prefixIcon: new Icon(
                          Icons.person_outline,
                          color: Colors.white,
                        ),
                        labelText: "Nama Belakang",
                        labelStyle: new TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10),
                            borderSide: new BorderSide(
                                color: Colors.white,
                                width: 1
                            )
                        ),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10),
                            borderSide: new BorderSide(
                                color: Colors.white,
                                width: 1
                            )
                        ),
                      ),
                      cursorColor: Colors.white,
                      style: new TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: new DropdownButtonHideUnderline(
                      child: new ButtonTheme(
                        alignedDropdown: true,
                        child: new DropdownButton(
                          items: _dropDownMenuItems,
                          value: pilihJenisKelamin,
                          onChanged:(String pilihan){
                            setState(() {
                              this.pilihJenisKelamin=pilihan;
                            });
                          },
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                          elevation: 8,
                          isExpanded: true,
                          hint: new Text("Pilih Jenis Kelamin"),
                          disabledHint: new Text("Pilih Jenis Kelamin"),
                        ),
                      ),
                    )
                  ),
                  new RaisedButton(
                    elevation: 2,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10)
                    ),
                    color: Colors.lightBlue,
                    child: new Text(
                      "Pilih Tanggal Lahir",
                      style: new TextStyle(
                        color:Colors.white,
                      ),
                    ),
                    onPressed: (){
                      this.getDate();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new TextFormField(
                      validator: this.validateEmail,
                      controller: emailController,
                      decoration: new InputDecoration(
                        prefixIcon: new Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        labelText: "Email",
                        labelStyle: new TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10),
                            borderSide: new BorderSide(
                                color: Colors.white,
                                width: 1
                            )
                        ),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10),
                            borderSide: new BorderSide(
                                color: Colors.white,
                                width: 1
                            )
                        ),
                      ),
                      cursorColor: Colors.white,
                      style: new TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new TextFormField(
                      controller: noKontakController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        prefixIcon: new Icon(
                          Icons.phone_android,
                          color: Colors.white,
                        ),
                        labelText: "No Kontak",
                        labelStyle: new TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10),
                            borderSide: new BorderSide(
                                color: Colors.white,
                                width: 1
                            )
                        ),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10),
                            borderSide: new BorderSide(
                                color: Colors.white,
                                width: 1
                            )
                        ),
                      ),
                      cursorColor: Colors.white,
                      style: new TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:75.0),
                    child: new RaisedButton(
                      elevation: 8,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15)
                      ),
                      color: Colors.white,
                      child: new Text(
                        "Konfirmasi",
                        style: new TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: (){
                        showDialog(
                          context: context,
                          builder:(context){
                            return new AlertDialog(
                              title: new Text(
                                "Pastikan Biodata yang diisikan sudah benar"
                              ),
                              actions: <Widget>[
                                StreamBuilder<Object>(
                                  stream: this.widget.formBiodataBloc.formBiodataStream,
                                  builder: (context, snapshot) {
                                    return new RaisedButton(
                                      elevation: 6,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(15)
                                      ),
                                      color: Colors.green,
                                      child: new Text(
                                          "Sudah Benar",
                                        style: new TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      onPressed: (){
                                        if(_formKey.currentState.validate()){
                                          this.widget.formBiodataBloc.registrasiBiodataStream(
                                              namaDepan: namaDepanController.text,
                                              namaBelakang: namaBelakangController.text,
                                              tanggalLahir: "${date.year}-${date.month}-${date.day}",
                                              email: emailController.text,
                                              jenisKelamin: pilihJenisKelamin,
                                              noKontak: noKontakController.text
                                          );
                                          namaDepanController.text='';
                                          namaBelakangController.text='';
                                          emailController.text = '';
                                          noKontakController.text='';

                                          Navigator.pop(context);
                                        }
                                      },
                                    );
                                  }
                                ),
                                new RaisedButton(
                                  elevation: 6,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(15)
                                  ),
                                  child: new Text(
                                      "Cek Lagi",
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  color: Colors.red,
                                  onPressed: (){
                                    print("Cek Lagi");
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          }
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
