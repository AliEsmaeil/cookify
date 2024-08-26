import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_assets.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/reusable_widgets/custom_text_field.dart';

class TabSliverAppBar extends StatelessWidget {

  final TextEditingController favoriteSearchController = TextEditingController();

  final String tabTitle;
  TabSliverAppBar({super.key, required this.tabTitle});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
      ),
      primary: true,
      leading:  Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Image.asset(AppAssets.drawerIcon, width: 22.w, height: 11.h,),
      ),
      stretch: true,
      pinned: false,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: IconButton(
            icon: Icon(Icons.dark_mode_rounded),
            onPressed: (){},
          ),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title:
        Text(
            tabTitle,
          style: Theme.of(context).textTheme.titleSmall,
        ),

         stretchModes: [
           StretchMode.fadeTitle,
           StretchMode.blurBackground,
         ],
        expandedTitleScale: 1.5,
      ),
      expandedHeight: context.height/6,
    );
  }
}
