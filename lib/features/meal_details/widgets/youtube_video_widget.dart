import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoWidget extends StatefulWidget {
  final String url;

  const YouTubeVideoWidget({super.key, required this.url});

  @override
  State<YouTubeVideoWidget> createState() => _YouTubeVideoWidgetState();
}

class _YouTubeVideoWidgetState extends State<YouTubeVideoWidget> {
  
  late YoutubePlayerController controller;
  
  @override
  void initState(){
    super.initState();
    String? videoId = YoutubePlayer.convertUrlToId(widget.url,)!;

    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        hideThumbnail: true,
        loop: false,


      )
    );
    
  }
  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: controller,
      progressColors: ProgressBarColors(
        backgroundColor: Colors.grey.shade300,
        playedColor: Colors.orange,
        bufferedColor: Colors.grey.shade300,
        handleColor: Colors.orange,
      ),
      progressIndicatorColor: Colors.orange,
      onReady: (){},
    );
  }
  }
