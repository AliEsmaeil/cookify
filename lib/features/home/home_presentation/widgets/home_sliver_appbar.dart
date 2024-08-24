import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_assets.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/core/extensions/context_extension.dart';
import 'package:wagba/features/home/home_presentation/widgets/searhc_segmented_button.dart';
import 'package:wagba/features/home/home_presentation/widgets/type_writer_effect_text.dart';
import 'package:wagba/reusable_widgets/custom_text_field.dart';

class HomeSliverAppBar extends StatefulWidget {

  HomeSliverAppBar({super.key});

  @override
  State<HomeSliverAppBar> createState() => _HomeSliverAppBarState();
}

class _HomeSliverAppBarState extends State<HomeSliverAppBar> {
  final mealSearchController = TextEditingController();

  bool showSearchBySegment = true;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Image.asset(AppAssets.drawerIcon, width: 22.w, height: 11.h,),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Column(
              children: [

                Icon(Icons.shopping_basket, color: AppColors.orangeColor, size: 20.w,),
                Text(
                    'My Basket',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 10,
                    color: const Color(0xFF27214D)
                  ),
                ),
              ],
            ),
          ),

      ],),
      scrolledUnderElevation: 0,

      expandedHeight: showSearchBySegment ? context.height /3 :  220.h,
      flexibleSpace: FlexibleSpaceBar(
        //expandedTitleScale: 1,
        background: Padding(
          padding: EdgeInsets.only(left: 12.w, top: 12.h),
          child: Align(
            alignment: Alignment.centerLeft,
              child: TypeWriterEffectText(
                text:  'Hello, What meal do you prefer for today?',
                style: Theme.of(context).textTheme.titleSmall ,
              ),
          ),
        ),
        ),

      bottom: PreferredSize(
        preferredSize:  Size(double.infinity, showSearchBySegment ? 100.h : 60.h),
        child: Column(
          children: [
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
            child: SizedBox(
              height: 56.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: mealSearchController,
                      //TODO: depends on search type (name or id)
                      textInputType: TextInputType.name,
                      prefixIconPath: AppAssets.searchIcon,
                      inputAction: TextInputAction.done,
                      hintText: 'Search for meals',
                      fillColor: Color(0xFFF3F4F9),
                      onTap: (){
                        //TODO: show search
                      },
                      onChanged: (s){
                        // get matched meals from api
                      },
                      onSubmitted: (s){},
                      hintTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Color(0xFF86869E),
                      ),
                    ),
                  ),
                  IconButton(
                    // icon: Image.asset(AppAssets.searchSettingsIcon,
                    //   width: 23.w,
                    //   height: 15.h,
                    // ),
                    icon: Icon(Icons.filter_alt_outlined, weight: .2,),
                    style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(showSearchBySegment? AppColors.orangeColor :
                      Theme.of(context).brightness == Brightness.light? Colors.black: Colors.white,
                      ),
                    ),
                    onPressed: (){
                      setState(() {
                        showSearchBySegment = !showSearchBySegment;
                      });
                    },
                  )
                ],
              ),
            ),
                  ),
            if(showSearchBySegment)
              SearchSegmentedButton()
          ],
        ),

      ),
      primary: true,

      elevation: 0,
      stretch: false,
      pinned: true,
      floating: false,

    );
  }
}
