import 'package:ders1/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  late String spKullaniciAdi;
  late String spKullaniciSifre;

  Future<void> oturumBilgisiOku() async {
    var sp = await SharedPreferences.getInstance();

    setState(() {
      spKullaniciAdi = sp.getString("kullaniciAdi ") ?? "kullanici yok";
      spKullaniciSifre = sp.getString("kullaniciSifre") ?? "sifre yok";
    });
  }

  Future<void> cikisYap() async {
    var sp = await SharedPreferences.getInstance();
    sp.remove("kullaniciAdi");
    sp.remove("kullaniciSifre");

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginEkrani()));
  }

  @override
  void initState() {
    super.initState();
    oturumBilgisiOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ana sayfa"),
        actions: [
          IconButton(
              onPressed: () {
                cikisYap();
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text("kullanıcı adı : $spKullaniciAdi"),
            Text("şifre: $spKullaniciSifre")
          ],
        ),
      ),
    );
  }
}
