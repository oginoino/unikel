import 'dart:ui';
import '../../../../utils/imports/common_libs.dart';
import 'glass_theme.dart';

class GlassmorphismContainer extends StatelessWidget {
  const GlassmorphismContainer({
    super.key,
    required this.child,
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
  });

  final Widget child;
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final glassTheme = theme.extension<GlassTheme>();

    final double effectiveBlur =
        blurAmount ?? glassTheme?.blurAmount ?? uiConstants.glassBlurMedium;
    final double effectiveBorderWidth =
        borderWidth ??
        glassTheme?.borderWidth ??
        uiConstants.glassBorderWidthThin;
    final BorderRadius effectiveBorderRadius =
        borderRadius ?? BorderRadius.circular(uiConstants.radius16);

    final Color effectiveBackgroundColor =
        backgroundColor ??
        (isDark ? uiConstants.glassBlackMedium : uiConstants.glassWhiteMedium);

    final Gradient effectiveBorderGradient =
        borderGradient ??
        (isDark
            ? LinearGradient(
                colors: [
                  glassTheme?.glassBorderColorStart ??
                      uiConstants.glassBorderDarkStart,
                  glassTheme?.glassBorderColorEnd ??
                      uiConstants.glassBorderDarkEnd,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : LinearGradient(
                colors: [
                  uiConstants.glassBorderLightStart,
                  uiConstants.glassBorderLightEnd,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ));

    return Container(
      width: width,
      height: height,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        borderRadius: effectiveBorderRadius,
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: (isDark ? Colors.black : Colors.white).withValues(
                  alpha: 0.1,
                ),
                blurRadius: effectiveBlur,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              ),
            ],
      ),
      child: ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: effectiveBlur,
            sigmaY: effectiveBlur,
          ),
          child: Container(
            padding: padding ?? EdgeInsets.all(uiConstants.spacing4),
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
                    color: Colors.white.withValues(alpha: 0.3),
                  ),
                  borderRadius: effectiveBorderRadius,
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
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

    Widget content = GlassmorphismContainer(
      margin: margin,
      padding: padding ?? EdgeInsets.all(uiConstants.spacing6),
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
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(uiConstants.radius16),
        child: content,
      );
    }

    return content;
  }
}
