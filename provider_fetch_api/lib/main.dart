import 'package:flutter/material.dart';
import 'package:provider_api/data/datasources/post_datasources.dart';
import 'package:provider_api/data/datasources/post_datasources_impl.dart';
import 'package:provider_api/data/repositories/post_repository_impl.dart';
import 'package:provider_api/domain/repositories/data_repository.dart';
import 'package:provider_api/domain/usecases/data_fetch.dart';
import 'package:provider_api/presentation/screens/homePage.dart';
import 'package:provider_api/presentation/viewmodel/post_viewmodel.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<http.Client>(
          create: (_) => http.Client(),
        ),
        Provider<PostDatasources>(
            create: (context) => PostDatasourcesImpl(context.read())),
        Provider<PostRepo>(
            create: (context) => PostRepositoryImpl(context.read())),
        Provider<DataFetch>(create: (context) => DataFetch(context.read())),
        ChangeNotifierProvider(
            create: (context) => PostViewmodel(context.read())..loadPosts())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}
