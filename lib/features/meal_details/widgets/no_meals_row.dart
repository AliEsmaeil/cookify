import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_colors.dart';

class NoMealsRow extends StatefulWidget {
  int noMeals = 1;
  int mealPrice;

  NoMealsRow({super.key,required this.mealPrice});

  @override
  State<NoMealsRow> createState() => _NoMealsRowState();
}

class _NoMealsRowState extends State<NoMealsRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline,),
                onPressed: (){
                  if(widget.noMeals>1){
                    setState(() {
                      widget.noMeals--;
                    });
                  }
                },
                style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size.square(32.r)),
                  backgroundColor: MaterialStatePropertyAll(Colors.orange.shade100),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(widget.noMeals.toString()),
              ),

              IconButton(
                icon: Icon(Icons.add, color: AppColors.orangeColor,),
                onPressed: (){
                  setState(() {
                    widget.noMeals++;
                  });
                },
                style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size.square(32.r)),
                  backgroundColor: MaterialStatePropertyAll(Colors.orange.shade100),
                ),
              ),

            ],
          ),
          Text(
            '\$ ${widget.mealPrice * widget.noMeals}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
