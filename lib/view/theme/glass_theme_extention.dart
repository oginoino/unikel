import 'dart:ui';

import 'package:flutter/material.dart';

/// Define um conjunto de superfícies de vidro reutilizáveis para a UI.
@immutable
class GlassSurfaceStyle {
  const GlassSurfaceStyle({
    required this.background,
    required this.borderGradient,
    required this.shadow,
    required this.blur,
    required this.borderWidth,
    required this.radius,
    required this.padding,
  });

  final Color background;
  final Gradient borderGradient;
  final List<BoxShadow> shadow;
  final double blur;
  final double borderWidth;
  final double radius;
  final EdgeInsetsGeometry padding;

  GlassSurfaceStyle copyWith({
    Color? background,
    Gradient? borderGradient,
    List<BoxShadow>? shadow,
    double? blur,
    double? borderWidth,
    double? radius,
    EdgeInsetsGeometry? padding,
  }) {
    return GlassSurfaceStyle(
      background: background ?? this.background,
      borderGradient: borderGradient ?? this.borderGradient,
      shadow: shadow ?? this.shadow,
      blur: blur ?? this.blur,
      borderWidth: borderWidth ?? this.borderWidth,
      radius: radius ?? this.radius,
      padding: padding ?? this.padding,
    );
  }

  static GlassSurfaceStyle lerp(
    GlassSurfaceStyle a,
    GlassSurfaceStyle b,
    double t,
  ) {
    return GlassSurfaceStyle(
      background: Color.lerp(a.background, b.background, t) ?? a.background,
      borderGradient:
          Gradient.lerp(a.borderGradient, b.borderGradient, t) ??
              a.borderGradient,
      shadow: BoxShadow.lerpList(a.shadow, b.shadow, t) ?? a.shadow,
      blur: lerpDouble(a.blur, b.blur, t) ?? a.blur,
      borderWidth: lerpDouble(a.borderWidth, b.borderWidth, t) ??
          a.borderWidth,
      radius: lerpDouble(a.radius, b.radius, t) ?? a.radius,
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t) ?? a.padding,
    );
  }
}

enum GlassSurfaceVariant { surface, elevated, control, navigation }

@immutable
class GlassTheme extends ThemeExtension<GlassTheme> {
  const GlassTheme({
    required this.surface,
    required this.elevated,
    required this.control,
    required this.navigation,
    required this.focusColor,
    required this.focusWidth,
    required this.textShadow,
    required this.inverseTextShadow,
  });

  final GlassSurfaceStyle surface;
  final GlassSurfaceStyle elevated;
  final GlassSurfaceStyle control;
  final GlassSurfaceStyle navigation;
  final Color focusColor;
  final double focusWidth;
  final Color textShadow;
  final Color inverseTextShadow;

  @override
  GlassTheme copyWith({
    GlassSurfaceStyle? surface,
    GlassSurfaceStyle? elevated,
    GlassSurfaceStyle? control,
    GlassSurfaceStyle? navigation,
    Color? focusColor,
    double? focusWidth,
    Color? textShadow,
    Color? inverseTextShadow,
  }) {
    return GlassTheme(
      surface: surface ?? this.surface,
      elevated: elevated ?? this.elevated,
      control: control ?? this.control,
      navigation: navigation ?? this.navigation,
      focusColor: focusColor ?? this.focusColor,
      focusWidth: focusWidth ?? this.focusWidth,
      textShadow: textShadow ?? this.textShadow,
      inverseTextShadow: inverseTextShadow ?? this.inverseTextShadow,
    );
  }

  @override
  GlassTheme lerp(ThemeExtension<GlassTheme>? other, double t) {
    if (other is! GlassTheme) return this;

    return GlassTheme(
      surface: GlassSurfaceStyle.lerp(surface, other.surface, t),
      elevated: GlassSurfaceStyle.lerp(elevated, other.elevated, t),
      control: GlassSurfaceStyle.lerp(control, other.control, t),
      navigation: GlassSurfaceStyle.lerp(navigation, other.navigation, t),
      focusColor: Color.lerp(focusColor, other.focusColor, t) ?? focusColor,
      focusWidth: lerpDouble(focusWidth, other.focusWidth, t) ?? focusWidth,
      textShadow: Color.lerp(textShadow, other.textShadow, t) ?? textShadow,
      inverseTextShadow:
          Color.lerp(inverseTextShadow, other.inverseTextShadow, t) ??
              inverseTextShadow,
    );
  }
}
