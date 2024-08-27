import 'package:flutter/cupertino.dart';
import 'package:wagba/core/constants/app_visual_properties.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/reusable_widgets/loading_container.dart';

class LoadingFavoritesWidget extends StatelessWidget {
  const LoadingFavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList.builder(
    itemBuilder: (context,index)=>Padding(
      padding: EdgeInsets.all(AppVisualProperties.defaultPadding),
      child: LoadingContainer(),
    ),
    itemExtent: context.width / 1.2,
      itemCount: 15,
);
  }
}
