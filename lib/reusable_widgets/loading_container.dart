import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingContainer extends StatefulWidget {
  final double? width;
  final double? height;

  const LoadingContainer({super.key, this.width, this.height });

  @override
  State<LoadingContainer> createState() => _LoadingContainerState();
}

class _LoadingContainerState extends State<LoadingContainer> {
  double opacity = 0.35;

  @override
  void initState(){
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(mounted){
        setState(() {
          opacity = opacity == 0.35 ? 1 : 0.35;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      opacity: opacity,
      curve: Curves.easeIn,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: const SizedBox.expand(),
      )
    );
  }
}
