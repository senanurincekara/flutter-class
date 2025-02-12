import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

/*
ThemeCubit, HydratedCubit sınıfından türetildi.
HydratedCubit<ThemeMode>, Cubit ile aynı şekilde çalışır ancak ek olarak theme durumu cihazda saklar.
Generic olarak ThemeMode kullanıdı, yani bu Cubit, ThemeMode tipindeki durumları yönetecek demek oluo.

 */
class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit()
      : super(ThemeMode
            .system); //ThemeMode.system, sistem temasına uygun olarak çalışır

  // Updating theme
  void updateTheme(ThemeMode theme) =>
      emit(theme); //Yeni tema durumu yayınlanır ve UI güncellenir.

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    return ThemeMode.values[json["theme"] as int];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'theme': state.index};
  }
}


/*

  - Kullanıcı temayı değiştirir → updateTheme(ThemeMode.dark) çağrılır.
  - Cubit emit metodu ile yeni durumu yayınlar.
  - Bloc dinleyicileri (BlocBuilder) bu değişimi yakalar ve UI’yi günceller.
  - toJson metodu ile bu durum JSON olarak kaydedilir.
  - Uygulama kapandığında fromJson metodu ile önceki tema yüklenir.

 */