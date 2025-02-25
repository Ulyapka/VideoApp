import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BetterPlayerScreen extends StatefulWidget {
  static const routeName = "/better_player_screen_route";

  const BetterPlayerScreen({super.key});

  @override
  BetterPlayerScreenState createState() => BetterPlayerScreenState();
}

class BetterPlayerScreenState extends State<BetterPlayerScreen> {
  BetterPlayerController? _betterPlayerController;

  Future<void> _pickVideo() async {
    /*
    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(),
    );

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    );

    _betterPlayerController.setupDataSource(dataSource);
  */

    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      File file = File(result.files.single.path!);
      BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.file,
        file.path,
      );
      _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
          expandToFill: false,
          fit: BoxFit.contain,
        ),
      );
      _betterPlayerController!.setupDataSource(dataSource);
      setState(() {});
    }
  }

  @override
  void dispose() {
    _betterPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Better Player'),
        leading: BackButton(
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: _betterPlayerController != null
            ? BetterPlayer(controller: _betterPlayerController!)
            : Text('No video selected'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickVideo,
        child: Icon(Icons.video_library),
      ),
    );
  }
}