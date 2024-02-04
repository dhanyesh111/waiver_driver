import 'package:flutter/material.dart';

import '../app_colors/app_colors.dart';

class CircleWithIndigoGradient extends StatelessWidget {
  final Widget child;
  final double height;
  const CircleWithIndigoGradient({
    super.key,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: AppColors.grey93),
      child: Center(child: child),
    );
  }
}

class CircleWithIndigoRed extends StatelessWidget {
  final Widget child;
  final double height;
  const CircleWithIndigoRed({
    super.key,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.red,
                AppColors.red176,
              ])),
      child: Center(child: child),
    );
  }
}
