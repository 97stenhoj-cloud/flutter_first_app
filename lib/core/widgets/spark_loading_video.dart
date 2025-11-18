// lib/core/widgets/spark_loading_video.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class SparkLoadingVideo extends StatefulWidget {
  const SparkLoadingVideo({super.key});

  @override
  State<SparkLoadingVideo> createState() => _SparkLoadingVideoState();
}

class _SparkLoadingVideoState extends State<SparkLoadingVideo> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;
  bool _hasError = false;
  final String _videoUrl =
      'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/video/spark_loading.mp4';

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      // Try to get cached video file first
      final fileInfo = await DefaultCacheManager().getFileFromCache(_videoUrl);

      File videoFile;
      if (fileInfo != null && fileInfo.file.existsSync()) {
        // Use cached video
        videoFile = fileInfo.file;
      } else {
        // Download and cache the video
        videoFile = await DefaultCacheManager().getSingleFile(_videoUrl);
      }

      // Initialize video player with cached file
      _controller = VideoPlayerController.file(videoFile);

      await _controller!.initialize();
      await _controller!.setLooping(true);
      await _controller!.play();

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('Error loading Spark loading video: $e');
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Show fallback loading indicator if video fails or not yet initialized
    if (_hasError || !_isInitialized || _controller == null) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0xFFFF6B9D),
          strokeWidth: 3,
        ),
      );
    }

    // Show the video
    return Center(
      child: AspectRatio(
        aspectRatio: _controller!.value.aspectRatio,
        child: VideoPlayer(_controller!),
      ),
    );
  }
}
