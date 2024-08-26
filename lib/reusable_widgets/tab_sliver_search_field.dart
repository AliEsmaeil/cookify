import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_assets.dart';
import 'package:wagba/reusable_widgets/custom_text_field.dart';

class TabSliverSearchField extends StatelessWidget {
  final TextEditingController tabSearchController = TextEditingController();

  TabSliverSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(20.r),
      sliver: SliverAppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
        ),

        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.zero,
          title: CustomTextField(
            controller: tabSearchController,
            hintText: 'Search for a Meal',
            textInputType: TextInputType.text,
            inputAction: TextInputAction.search,
            prefixIconPath: AppAssets.searchIcon,
            isForTabs: true,
          ),
        ),
        expandedHeight: 40.h ,
        pinned: true,
        stretch: true,
      ),
    );
  }
}
