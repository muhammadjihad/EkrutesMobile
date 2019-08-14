import 'dart:async';

import 'provider.dart';

class FormBiodataBloc{

//  Initializing Provider
  final FormBiodataProvider formBiodataProvider = new FormBiodataProvider();

  StreamController formBiodataController = new StreamController.broadcast();

  Stream get formBiodataStream => formBiodataController.stream;

  void dispose(){
    formBiodataController.close();
  }

  Future<void> registrasiBiodataStream({namaDepan,namaBelakang,jenisKelamin,tanggalLahir,noKontak,email}) async{
    this.formBiodataProvider.registrasiBiodata(
      namaDepan: namaDepan,
      namaBelakang: namaBelakang,
      jenisKelamin: jenisKelamin,
      tanggalLahir: tanggalLahir,
      noKontak: noKontak,
      email: email
    );
  }


}