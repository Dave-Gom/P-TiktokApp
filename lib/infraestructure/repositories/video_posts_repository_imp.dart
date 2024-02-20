import 'package:toktik/domain/datasource/video_post_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImplementation implements VideoPostRepository {
  final VideoPostDatasource videosDataSource;

  VideoPostsRepositoryImplementation({required this.videosDataSource});

  @override
  Future<List<VideoPost>> getFevoriteVideosByUser(int userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPager(int page) {
    return videosDataSource.getTrendingVideosByPage(page);
  }
}
