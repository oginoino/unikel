import 'dart:ui'; // Necessário para lerpDouble
import 'package:flutter/material.dart';

@immutable
class GlassTheme extends ThemeExtension<GlassTheme> {
  final Color glassColor;
  final Color glassBorderColor;
  final Color glassBorderColorStart;
  final Color glassBorderColorEnd;
  final double blurAmount;
  final double borderWidth; // Corrigido de 'borderWith' para 'borderWidth'

  const GlassTheme({
    required this.glassColor,
    required this.glassBorderColor,
    required this.glassBorderColorStart,
    required this.glassBorderColorEnd,
    required this.blurAmount,
    required this.borderWidth,
  });

  @override
  GlassTheme copyWith({
    Color? glassColor,
    Color? glassBorderColor,
    Color? glassBorderColorStart,
    Color? glassBorderColorEnd,
    double? blurAmount,
    double? borderWidth,
  }) {
    return GlassTheme(
      glassColor: glassColor ?? this.glassColor,
      glassBorderColor: glassBorderColor ?? this.glassBorderColor,
      glassBorderColorStart:
          glassBorderColorStart ?? this.glassBorderColorStart,
      glassBorderColorEnd: glassBorderColorEnd ?? this.glassBorderColorEnd,
      blurAmount: blurAmount ?? this.blurAmount,
      borderWidth: borderWidth ?? this.borderWidth,
    );
  }

  @override
  GlassTheme lerp(ThemeExtension<GlassTheme>? other, double t) {
    if (other is! GlassTheme) return this;
    return GlassTheme(
      glassColor: Color.lerp(glassColor, other.glassColor, t)!,
      glassBorderColor: Color.lerp(
        glassBorderColor,
        other.glassBorderColor,
        t,
      )!,
      glassBorderColorStart: Color.lerp(
        glassBorderColorStart,
        other.glassBorderColorStart,
        t,
      )!,
      glassBorderColorEnd: Color.lerp(
        glassBorderColorEnd,
        other.glassBorderColorEnd,
        t,
      )!,
      // CORREÇÃO AQUI: Usando lerpDouble em vez de double.lerp
      blurAmount: lerpDouble(blurAmount, other.blurAmount, t)!,
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t)!,
    );
  }
}
