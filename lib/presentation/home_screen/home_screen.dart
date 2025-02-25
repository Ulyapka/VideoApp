import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_app/presentation/better_player_screen/better_player_screen.dart';
import 'package:video_app/presentation/video_player_screen/video_player_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home_screen_route";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.push(VideoPlayerScreen.routeName),
              child: Text('Go to Video Player'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push(BetterPlayerScreen.routeName),
              child: Text('Go to Better Player'),
            ),
          ],
        ),
      ),
    );
  }
}
