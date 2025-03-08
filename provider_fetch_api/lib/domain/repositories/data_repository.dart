import 'package:provider_api/domain/entities/data.dart';

abstract class PostRepo {
  Future<List<PostData>> getPost();
}
