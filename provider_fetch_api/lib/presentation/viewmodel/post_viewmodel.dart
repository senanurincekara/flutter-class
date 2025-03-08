// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:provider_api/domain/entities/data.dart';
import 'package:provider_api/domain/usecases/data_fetch.dart';

class PostViewmodel extends ChangeNotifier {
  final DataFetch dataUseCasesDataFetch;
  List<PostData> posts = [];
  bool isLoading;

  PostViewmodel(this.dataUseCasesDataFetch)
      : posts = [],
        isLoading = false;

  Future<void> loadPosts() async {
    isLoading = true;
    notifyListeners();

    try {
      posts = await dataUseCasesDataFetch.fetchPosts();
    } catch (e) {}

    isLoading = false;
    notifyListeners();
  }
}
