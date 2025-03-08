import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/post_viewmodel.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PostViewmodel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Provider - Api Fetch Data Example"),
        ),
        body: viewModel.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: viewModel.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(viewModel.posts[index].title),
                    subtitle: Text(viewModel.posts[index].body),
                  );
                }));
  }
}
