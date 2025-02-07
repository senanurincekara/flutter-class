import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Cache the data with BLoC and Hive",
              style: theme.textTheme.titleLarge, // Doğru TextStyle kullanımı
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: width,
        height: height,
      ),
    );
  }
}
