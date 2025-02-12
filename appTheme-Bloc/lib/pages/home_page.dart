import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<(String, ThemeMode)> themes = const [
    ("Dark", ThemeMode.dark),
    ("Light", ThemeMode.light),
    ("System", ThemeMode.system)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: themes.map((theme) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<ThemeCubit>().updateTheme(theme.$2);
                  },
                  child: Text(theme.$1),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
