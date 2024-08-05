import 'package:flutter/material.dart';
import 'package:wagba/core/extensions/context_extension.dart';

class KitchenTab extends StatelessWidget {
  final String kitchenName;

  const KitchenTab({super.key, required this.kitchenName});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.width / 4,
        child: Tab(
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                kitchenName,
                textAlign: TextAlign.start,
              )),
        ));
  }
}
