import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  final double blur;
  final double opacity;
  final Widget child;
  // ignore: use_key_in_widget_constructors
  const GlassMorphism({this.blur = 0.0, required this.child, this.opacity = 0.0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:  BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur , sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: child ,
        ),
      ),

    );
  }
}
