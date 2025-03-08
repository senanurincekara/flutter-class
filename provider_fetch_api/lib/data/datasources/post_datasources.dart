import 'package:provider_api/domain/entities/data.dart';

abstract class PostDatasources {
  Future<List<PostData>> fetchPostsDataSources();
}
