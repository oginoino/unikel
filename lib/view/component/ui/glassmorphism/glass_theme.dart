import 'package:flutter/material.dart';
import 'dart:ui' show lerpDouble;

@immutable
class GlassTheme extends ThemeExtension<GlassTheme> {
  const GlassTheme({
    this.blurAmount,
    this.borderWidth,
    this.glassBorderColorStart,
    this.glassBorderColorEnd,
  });

  final double? blurAmount;
  final double? borderWidth;
  final Color? glassBorderColorStart;
  final Color? glassBorderColorEnd;

  @override
  ThemeExtension<GlassTheme> copyWith({
    double? blurAmount,
    double? borderWidth,
    Color? glassBorderColorStart,
    Color? glassBorderColorEnd,
  }) {
    return GlassTheme(
      blurAmount: blurAmount ?? this.blurAmount,
      borderWidth: borderWidth ?? this.borderWidth,
      glassBorderColorStart:
          glassBorderColorStart ?? this.glassBorderColorStart,
      glassBorderColorEnd: glassBorderColorEnd ?? this.glassBorderColorEnd,
    );
  }

  @override
  ThemeExtension<GlassTheme> lerp(ThemeExtension<GlassTheme>? other, double t) {
    if (other is! GlassTheme) {
      return this;
    }

    return GlassTheme(
      blurAmount: lerpDouble(blurAmount, other.blurAmount, t),
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t),
      glassBorderColorStart: Color.lerp(
        glassBorderColorStart,
        other.glassBorderColorStart,
        t,
      ),
      glassBorderColorEnd: Color.lerp(
        glassBorderColorEnd,
        other.glassBorderColorEnd,
        t,
      ),
    );
  }
}
