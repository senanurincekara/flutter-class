import 'package:ders1/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> oturumkontrol() async {
    var sp = await SharedPreferences.getInstance();

    String spKullaniciAdi = sp.getString("kullaniciAdi ") ?? "kullanici yok";
    String spKullaniciSifre = sp.getString("kullaniciSifre") ?? "sifre yok";

    if (spKullaniciAdi == "admin" && spKullaniciSifre == "123") {
      return true;
    } else {
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<bool>(
            future: oturumkontrol(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                bool gecisIzni = snapshot.hasData;
                return gecisIzni ? Anasayfa() : LoginEkrani();
              } else {
                return Container();
              }
            }));
  }
}

class LoginEkrani extends StatefulWidget {
  const LoginEkrani({super.key});
  @override
  State<LoginEkrani> createState() => _LoginEkraniState();
}

class _LoginEkraniState extends State<LoginEkrani> {
  var userName = TextEditingController();
  var userPassword = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> GirisKontrol() async {
    var kullaniciAdi = userName.text;
    var kullaniciPassword = userPassword.text;

    if (kullaniciAdi == "admin" && kullaniciPassword == "123") {
      var sp = await SharedPreferences.getInstance();
      sp.setString("kullaniciAdi", kullaniciAdi);
      sp.setString("kullaniciSifre", kullaniciPassword);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Anasayfa()));
    } else {
      //giriş hatalı
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: userName,
              decoration: InputDecoration(hintText: "kullanıcı adı :  "),
            ),
            TextField(
              obscureText: true,
              controller: userPassword,
              decoration: InputDecoration(hintText: "şifre:  "),
            ),
            TextButton(
                onPressed: () {
                  GirisKontrol();
                },
                child: Text("giriş yap"))
          ],
        ),
      ),
    );
  }
}
