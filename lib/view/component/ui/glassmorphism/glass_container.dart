import 'dart:ui';

import 'package:glassy/view/theme/glass_theme_extention.dart';

import '../../../../utils/imports/common_libs.dart';

class GlassmorphismContainer extends StatelessWidget {
  const GlassmorphismContainer({
    super.key,
    required this.child,
    this.variant = GlassSurfaceVariant.surface,
    this.blurAmount,
    this.borderRadius,
    this.borderWidth,
    this.borderGradient,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.alignment,
    this.boxShadow,
    this.semanticLabel,
  });

  final Widget child;
  final GlassSurfaceVariant variant;
  final double? blurAmount;
  final BorderRadius? borderRadius;
  final double? borderWidth;
  final Gradient? borderGradient;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final List<BoxShadow>? boxShadow;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final glassTheme = theme.extension<GlassTheme>();

    final GlassSurfaceStyle style = _resolveStyle(
      glassTheme: glassTheme,
      variant: variant,
      isDark: isDark,
    );

    final double effectiveBlur = blurAmount ?? style.blur;
    final double effectiveBorderWidth =
        borderWidth ?? style.borderWidth;
    final BorderRadius effectiveBorderRadius =
        borderRadius ?? BorderRadius.circular(style.radius);
    final Color effectiveBackgroundColor =
        backgroundColor ?? style.background;
    final Gradient effectiveBorderGradient =
        borderGradient ?? style.borderGradient;
    final EdgeInsetsGeometry effectivePadding =
        padding ?? style.padding;
    final List<BoxShadow> effectiveShadow = boxShadow ?? style.shadow;

    final Color primaryShadow =
        glassTheme?.textShadow ??
            (isDark
                ? Colors.black.withValues(alpha: 0.32)
                : Colors.white.withValues(alpha: 0.38));
    final Color secondaryShadow =
        glassTheme?.inverseTextShadow ??
            (isDark
                ? Colors.white.withValues(alpha: 0.24)
                : Colors.black.withValues(alpha: 0.18));

    Widget content = AnimatedContainer(
      duration: Duration(milliseconds: uiConstants.animationDurationDefault),
      curve: Curves.easeOutCubic,
      width: width,
      height: height,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        borderRadius: effectiveBorderRadius,
        boxShadow: effectiveShadow,
      ),
      child: ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: effectiveBlur,
            sigmaY: effectiveBlur,
          ),
          child: Container(
            padding: effectivePadding,
            decoration: BoxDecoration(
              color: effectiveBackgroundColor,
              borderRadius: effectiveBorderRadius,
              border: Border.all(
                width: effectiveBorderWidth,
                color: Colors.transparent,
              ),
            ),
            child: ShaderMask(
              shaderCallback: (bounds) =>
                  effectiveBorderGradient.createShader(bounds),
              blendMode: BlendMode.srcATop,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: effectiveBorderWidth,
                    color: Colors.white.withValues(alpha: 0.24),
                  ),
                  borderRadius: effectiveBorderRadius,
                ),
                child: DefaultTextStyle(
                  style: DefaultTextStyle.of(context).style.copyWith(
                    shadows: [
                      Shadow(
                        color: primaryShadow,
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                      Shadow(
                        color: secondaryShadow,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (semanticLabel != null) {
      content = Semantics(
        container: true,
        label: semanticLabel,
        child: content,
      );
    }

    return content;
  }

  GlassSurfaceStyle _resolveStyle({
    GlassTheme? glassTheme,
    required GlassSurfaceVariant variant,
    required bool isDark,
  }) {
    final fallback = GlassSurfaceStyle(
      background:
          isDark ? uiConstants.glassBlackMedium : uiConstants.glassWhiteMedium,
      borderGradient: LinearGradient(
        colors: isDark
            ? [
                uiConstants.glassBorderDarkStart,
                uiConstants.glassBorderDarkEnd,
              ]
            : [
                uiConstants.glassBorderLightStart,
                uiConstants.glassBorderLightEnd,
              ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      shadow: [
        BoxShadow(
          color: (isDark ? Colors.black : Colors.grey).withValues(alpha: 0.08),
          blurRadius: 16,
          offset: const Offset(0, 10),
        ),
      ],
      blur: uiConstants.glassBlurMedium,
      borderWidth: uiConstants.glassBorderWidthThin,
      radius: uiConstants.radius16,
      padding: EdgeInsets.all(uiConstants.spacing4),
    );

    if (glassTheme == null) return fallback;

    switch (variant) {
      case GlassSurfaceVariant.surface:
        return glassTheme.surface;
      case GlassSurfaceVariant.elevated:
        return glassTheme.elevated;
      case GlassSurfaceVariant.control:
        return glassTheme.control;
      case GlassSurfaceVariant.navigation:
        return glassTheme.navigation;
    }
  }
}

class GlassmorphismCard extends StatelessWidget {
  const GlassmorphismCard({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.icon,
    this.onTap,
    this.elevation = 0,
    this.margin,
    this.padding,
  });

  final Widget child;
  final String? title;
  final String? subtitle;
  final Widget? icon;
  final VoidCallback? onTap;
  final double elevation;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final glassTheme = theme.extension<GlassTheme>();

    Widget content = GlassmorphismContainer(
      variant: GlassSurfaceVariant.elevated,
      margin: margin,
      padding: padding ?? EdgeInsets.all(uiConstants.spacing6),
      semanticLabel: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null || subtitle != null || icon != null) ...[
            Row(
              children: [
                if (icon != null) ...[
                  icon!,
                  SizedBox(width: uiConstants.spacing3),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null)
                        Text(
                          title!,
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                            shadows: [
                              Shadow(
                                color: glassTheme?.textShadow ??
                                    theme.colorScheme.onSurface
                                        .withValues(alpha: 0.12),
                                blurRadius: 3,
                                offset: const Offset(0, 1),
                              ),
                              Shadow(
                                color: glassTheme?.inverseTextShadow ??
                                    theme.colorScheme.onSurface
                                        .withValues(alpha: 0.08),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: uiConstants.spacing4),
          ],
          child,
        ],
      ),
    );

    if (onTap != null) {
      content = Semantics(
        button: true,
        enabled: true,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(uiConstants.radius16),
          focusColor: glassTheme?.focusColor.withValues(alpha: 0.15),
          child: content,
        ),
      );
    }

    return content;
  }
}
