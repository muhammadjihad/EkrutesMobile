import 'package:http/http.dart' as http;

class FormBiodataProvider{

  final String domain="http://172.16.17.132:8000";

  Future<void> registrasiBiodata({namaDepan,namaBelakang,jenisKelamin,tanggalLahir,noKontak,email})async{
    http.Response _ = await http.post(domain+"/peserta-api/register/",
    body: {
      'namaDepan':namaDepan,
      'namaBelakang':namaBelakang,
      'jenisKelamin':jenisKelamin,
      'tanggalLahir':tanggalLahir,
      'noKontak':noKontak,
      'email':email
    });
  }

}