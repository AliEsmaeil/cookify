import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_colors.dart';
import 'package:wagba/core/enums/meal_search_by.dart';

class SearchSegmentedButton extends StatefulWidget {
  const SearchSegmentedButton({super.key});

  @override
  State<SearchSegmentedButton> createState() => SearchSegmentedButtonState();

}


class SearchSegmentedButtonState extends State<SearchSegmentedButton> {

  static MealSearchBy currentSelection = MealSearchBy.name;
  static String searchBy()=>currentSelection.name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SegmentedButton<MealSearchBy>(
            style: SegmentedButton.styleFrom(
              animationDuration: const Duration(seconds: 2),
              fixedSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12.r),
                )
              ),
              backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
              surfaceTintColor: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
              side: BorderSide.none,
              elevation: 1,
              visualDensity: VisualDensity.comfortable,
              foregroundColor: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
              alignment: Alignment.center,
              minimumSize:  const Size(double.infinity, 40),
              selectedBackgroundColor: AppColors.whiteColor,
              selectedForegroundColor: AppColors.orangeColor,
              textStyle: Theme.of(context).textTheme.bodyMedium,
            ),
            segments: const [

              ButtonSegment<MealSearchBy>(
                label:  Text('Name'),
                value: MealSearchBy.name,
              ),
              ButtonSegment<MealSearchBy>(
                label:  Text('Ingredient'),
                value: MealSearchBy.ingredient,
              ),
            ],
            selected: <MealSearchBy>{currentSelection},
          
            onSelectionChanged: (Set<MealSearchBy> selected){
              setState(() {
                currentSelection = selected.first;
              });
            },
          ),
        ),
      ],
    );
  }
}
