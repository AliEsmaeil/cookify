import 'package:flutter/material.dart';
import 'package:wagba/features/favorites/presentation/widgets/fav_meals_list_builder.dart';
import 'package:wagba/reusable_widgets/tab_sliver_app_bar.dart';
import 'package:wagba/reusable_widgets/tab_sliver_search_field.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      primary: true,
      slivers: [
        TabSliverAppBar(tabTitle: 'Favorites'),
        TabSliverSearchField(),
        FavoriteMealsListBuilder(),
      ],
    );
  }
}
