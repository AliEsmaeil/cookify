import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_assets.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/reusable_widgets/custom_text_field.dart';

class HomeSliverAppBar extends StatelessWidget {
  final mealSearchController = TextEditingController();

  HomeSliverAppBar({super.key});

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

      expandedHeight: 240.h,
      flexibleSpace: FlexibleSpaceBar(
        //expandedTitleScale: 1,
        background: Padding(
          padding: EdgeInsets.only(left: 12.w, top: 12.h),
          child: Align(
            alignment: Alignment.centerLeft,
              child: Text(
                'Hello, What meal do you prefer for today?',
                softWrap: true,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.titleSmall,
              )),
        ),
        ),

      bottom: PreferredSize(child: Padding(
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
              SizedBox(width: 16.w,),
              Image.asset(AppAssets.searchSettingsIcon, width: 23.w, height: 15.h,)
            ],
          ),
        ),
      ) , preferredSize: Size(double.infinity, 56.h),),
      primary: true,

      elevation: 0,
      stretch: false,
      pinned: true,
      floating: false,

    );
  }
}
