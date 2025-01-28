import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  var girdiText = TextEditingController();

  // Dosyaya yazma
  Future<void> veriYaz() async {
    var dosya = await getApplicationDocumentsDirectory();
    var uygulama_dosya_yolu = dosya.path;

    var my_dosya = File("$uygulama_dosya_yolu/dosyam.txt");

    await my_dosya.writeAsString(girdiText.text);
    setState(() {
      girdiText.text = ""; // Yazma işlemi sonrası TextField'ı temizle
    });
  }

  // Dosyadan okuma
  Future<void> veriOku() async {
    try {
      var dosya = await getApplicationDocumentsDirectory();
      var uygulama_dosya_yolu = dosya.path;

      var my_dosya = File("$uygulama_dosya_yolu/dosyam.txt");

      String okunanVeri = await my_dosya.readAsString();
      setState(() {
        girdiText.text = okunanVeri; // Okunan veriyi TextField'a yaz
      });
    } catch (e) {
      setState(() {
        girdiText.text = "Hata: ${e.toString()}";
      });
    }
  }

  // Dosyayı silme
  Future<void> veriSil() async {
    try {
      var dosya = await getApplicationDocumentsDirectory();
      var uygulama_dosya_yolu = dosya.path;

      var my_dosya = File("$uygulama_dosya_yolu/dosyam.txt");

      if (await my_dosya.exists()) {
        await my_dosya.delete(); // Dosyayı sil
        setState(() {
          girdiText.text = "Dosya silindi.";
        });
      } else {
        setState(() {
          girdiText.text = "Silinecek dosya bulunamadı.";
        });
      }
    } catch (e) {
      setState(() {
        girdiText.text = "Hata: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: girdiText,
              decoration: const InputDecoration(hintText: "Veri giriniz"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: veriYaz,
                  child: const Text("Yaz Buton"),
                ),
                TextButton(
                  onPressed: veriOku,
                  child: const Text("Oku Buton"),
                ),
                TextButton(
                  onPressed: veriSil,
                  child: const Text("Sil Buton"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
