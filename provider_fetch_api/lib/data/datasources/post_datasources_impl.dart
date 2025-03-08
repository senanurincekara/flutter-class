import 'dart:convert';

import 'package:provider_api/config/config.dart';
import 'package:provider_api/data/datasources/post_datasources.dart';
import 'package:provider_api/domain/entities/data.dart';
import 'package:http/http.dart' as http;

class PostDatasourcesImpl implements PostDatasources {
  final http.Client client;

  PostDatasourcesImpl(this.client);

  @override
  Future<List<PostData>> fetchPostsDataSources() async {
    final response = await client.get(Uri.parse('${Config.baseUrl}/posts'));
    if (response.statusCode == 200) {
      List<dynamic> bodyPost = json.decode(response.body);
      return bodyPost.map((dynamic item) => PostData.fromJson(item)).toList();
    } else {
      throw Exception('Veri alınamadı');
    }
  }
}
