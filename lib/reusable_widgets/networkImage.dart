import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_assets.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/reusable_widgets/loading_container.dart';

class CustomCachedNetworkImage extends StatelessWidget {

  final double? width;
  final double? height;
  final String? imgUrl;
  final BoxFit? fit;

  const CustomCachedNetworkImage({super.key, this.imgUrl, this.width , this.height , this.fit,});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl?? AppAssets.noImageAvailable,
      width: width ?? context.width/2,
      height: height ?? context.width/2,
      fit: fit ?? BoxFit.contain,
      errorWidget: (context,string,handler)=>const Center(child: Icon(Icons.error)),
      placeholder: (context,image)=>const LoadingContainer(),
      fadeInCurve: Curves.easeInOut,
      fadeInDuration: const Duration(milliseconds: 1500),
    );

  }
}
