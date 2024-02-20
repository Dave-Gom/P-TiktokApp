import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infraestructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infraestructure/repositories/video_posts_repository_imp.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discrover_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final videoPostRespository = VideoPostsRepositoryImplementation(
        videosDataSource: LocalVideoDatasource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DiscoverProvider(videoPostRespository)..loadNextPage(),
        )
      ],
      child: MaterialApp(
          title: 'TokTik',
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
