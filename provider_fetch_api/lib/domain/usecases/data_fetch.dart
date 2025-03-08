import 'package:provider_api/domain/entities/data.dart';
import 'package:provider_api/domain/repositories/data_repository.dart';

class DataFetch {
  final PostRepo postRepository;

  DataFetch(this.postRepository);

  Future<List<PostData>> fetchPosts() {
    return postRepository.getPost();
  }
}
