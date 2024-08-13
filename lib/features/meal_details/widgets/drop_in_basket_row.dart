import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/constants/app_assets.dart';

class DropInBasketRow extends StatelessWidget {
  const DropInBasketRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.r),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.orange.shade100),
            ),
          ),
          15.horizontalSpace,
          Expanded(
            child: FilledButton.icon(
              icon: Text('Drop in Basket'),
              onPressed: () {},
              label: Icon(Icons.shopping_basket),
            ),
          ),
        ],
      ),
    );
  }
}
