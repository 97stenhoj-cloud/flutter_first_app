import 'package:flutter/material.dart';


class GradientBackground extends StatelessWidget {
  final Widget child;
  final List<Color> colors;
  final List<double>? stops;

  const GradientBackground({
    super.key,
    required this.child,
    required this.colors,
    this.stops,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
          stops: stops,
        ),
      ),
      child: child,
    );
  }
}