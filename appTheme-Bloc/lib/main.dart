import 'package:bloc_app_theme/config/app_theme.dart';
import 'package:bloc_app_theme/pages/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/theme_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize HydratedBloc storage
  /// HydratedBloc.storage → hydrated_bloc paketinin depolama mekanizmasını başlatır.
  HydratedBloc.storage = await HydratedStorage.build(
    //Uygulama kapanıp açıldığında önceki durumun korunmasını sağlar.
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getApplicationDocumentsDirectory())
            .path), //Web dışı cihazlarda getApplicationDocumentsDirectory() ile depolama dizini belirlenir.
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return MaterialApp(
            title: 'Dynamic Theming with Hydrated Bloc & Cubit',
            debugShowCheckedModeBanner: false,
            theme: CustomAppTheme.light,
            darkTheme: CustomAppTheme.dark,
            themeMode: state,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
