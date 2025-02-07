import 'package:logger/web.dart';

final logger = Logger(
    printer: PrettyPrinter(
        methodCount:
            0, // Stack trace'te kaç metod gösterileceğini belirler (0 = gösterme).
        errorMethodCount:
            5, // Hata loglarında kaç metod gösterileceğini belirler.
        lineLength: 50, // Log satırının maksimum uzunluğu.
        colors: true, // Konsolda renkli çıktı almayı sağlar.
        printEmojis: true, // Loglarda emoji kullanımı (Örn: ✅, ❌).
        printTime:
            false // Logların başına zaman ekleyip eklemeyeceğini belirler.
        ));



//hata ayıklamak (debugging) ve loglama yapmak için kullanılan Logger paketini içerir.

/*
void main() {
  logger.d("Bu bir debug mesajıdır");  // Debug mesajı
  logger.i("Bu bir info mesajıdır");   // Bilgilendirici mesaj
  logger.w("Bu bir warning mesajıdır"); // Uyarı mesajı
  logger.e("Bu bir hata mesajıdır");    // Hata mesajı

  💡 INFO: Bu bir info mesajıdır
  ⚠️ WARNING: Bu bir warning mesajıdır
  ❌ ERROR: Bu bir hata mesajıdır

*/

