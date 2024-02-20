import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider(this.videosRepository);

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    //todo: cargar videos

    // final List<VideoPost> newVideos = videoPosts
    //     .map((e) => LocalVideoModel.fromJson(e).toVideoPostEntity())
    //     .toList();

    final newVideos = await videosRepository.getTrendingVideosByPager(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
