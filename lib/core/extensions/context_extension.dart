import 'package:flutter/cupertino.dart';

// extension on BuildContext to easily reach the screen dimensions

extension DimensionsExtension on BuildContext{

  double get width=> MediaQuery.of(this).size.width;

  double get height=> MediaQuery.of(this).size.width;

}