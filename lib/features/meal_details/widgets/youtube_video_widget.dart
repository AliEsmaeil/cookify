import 'package:flutter/material.dart';
import 'package:wagba/core/constants/app_colors.dart';
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
        autoPlay: true,
        hideThumbnail: true,
        //startAt: 5,
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
      ),
      progressIndicatorColor: Colors.orange,
      onReady: (){},
    );
  }
  }
