import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullcreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(children: [
          SizedBox.expand(
              child: FlullScreenPlayer(
            caption: videoPost.caption,
            url: videoPost.videoUrl,
          )),
          Positioned(
              bottom: 40, right: 10, child: VideoButtons(video: videoPost))
        ]);
      },
    );
  }
}
