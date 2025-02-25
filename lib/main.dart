import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_app/presentation/better_player_screen/better_player_screen.dart';
import 'package:video_app/presentation/home_screen/home_screen.dart';
import 'package:video_app/presentation/video_player_screen/video_player_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

void main() {
  runApp(VideoApp());
}

class VideoApp extends StatelessWidget {
  VideoApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: HomeScreen.routeName,
    routes: [
      GoRoute(
        path: HomeScreen.routeName,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: VideoPlayerScreen.routeName,
        builder: (context, state) => VideoPlayerScreen(),
      ),
      GoRoute(
        path: BetterPlayerScreen.routeName,
        builder: (context, state) => BetterPlayerScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'GoRouter + VideoPlayer + BetterPlayer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}