import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wagba/core/extensions/context_extension.dart';

class MealsInCategoryCarousel extends StatelessWidget {
  const MealsInCategoryCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: context.height / 3,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: false,
          padEnds: true,
          scrollDirection: Axis.horizontal,
          enableInfiniteScroll: true,
          initialPage: 0,
          scrollPhysics: BouncingScrollPhysics(),
          enlargeCenterPage: true,
          viewportFraction: .65,
          enlargeFactor: .5,
        ),
        items: List.generate(10, (index) => SizedBox(
          width: context.width,
          height: context.height/3,
          child: BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child:Container(
                color: Colors.grey.shade100.withOpacity(.2),
                  child: SizedBox.expand(
                    child: Center(child: Text(index.toString())),
                  )
              ),
          ),

        )),
      ),
    );
  }
}
