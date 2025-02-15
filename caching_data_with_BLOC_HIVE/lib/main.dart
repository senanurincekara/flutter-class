import 'package:cache/config/theme/app_theme.dart';
import 'package:cache/core/dependency_injection/di.dart';
import 'package:cache/core/dependency_injection/di_ex.dart';
import 'package:cache/feautures/home/presentation/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// waiting to inject the application dependencies
  await setUpDi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: BlocProvider<HomeBloc>(
          create: (_) => di<HomeBloc>()..add(HomeCallProductsEvent()),
          child: HomePage()),
    );
  }
}
