import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_assets.dart';
import 'package:wagba/reusable_widgets/custom_text_field.dart';

class TabSliverSearchField extends StatelessWidget {
  String hintText;

  final FutureOr<Iterable<Widget>> Function(BuildContext, SearchController) suggestionsBuilder;

  final TextEditingController tabSearchController = TextEditingController();

  TabSliverSearchField({super.key,required this.hintText, required this.suggestionsBuilder});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(20.r),
      sliver: SliverAppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        surfaceTintColor: Colors.transparent,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.zero,
          title: SearchAnchor(
            builder: (context,controller){
              return SearchBar(
                onTap: (){
                  if(!controller.isOpen){
                    controller.openView();
                  }
                },
                keyboardType: TextInputType.name,
                backgroundColor:  WidgetStatePropertyAll(Colors.grey.shade100),
                hintText: hintText,
                hintStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16, color: Colors.grey)),
                textInputAction: TextInputAction.search,
                //elevation: WidgetStatePropertyAll(2),
                surfaceTintColor: WidgetStatePropertyAll(Colors.grey.shade100),
                padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 10, vertical: 3)),
                leading: Icon(Icons.search),
                shadowColor: WidgetStatePropertyAll(Colors.transparent),
              );
            },
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.name,
            viewBackgroundColor: Colors.white,
            viewSurfaceTintColor: Colors.white,
            isFullScreen: true,
            suggestionsBuilder: suggestionsBuilder,
            //dividerColor: Colors.grey.shade500,
          ),
        ),
        expandedHeight: 40.h ,
        pinned: true,
        stretch: true,
      ),
    );
  }
}
