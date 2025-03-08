import 'package:provider_api/data/datasources/post_datasources.dart';
import 'package:provider_api/domain/entities/data.dart';
import 'package:provider_api/domain/repositories/data_repository.dart';

class PostRepositoryImpl implements PostRepo {
  final PostDatasources postDataSources;

  PostRepositoryImpl(this.postDataSources);

  @override
  Future<List<PostData>> getPost() async {
    return await postDataSources.fetchPostsDataSources();
  }
}
