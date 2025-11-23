import 'package:glassy/view/theme/glass_theme_extention.dart';

import '../../../../utils/imports/common_libs.dart';
import '../glassmorphism/glass_container.dart';

enum ButtonVariant { primary, secondary, text, glass }

class CustomCTAButton extends StatelessWidget {
  const CustomCTAButton({
    super.key,
    this.variant = ButtonVariant.primary,
    this.icon,
    this.iconAlignment = IconAlignment.start,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.useGlassmorphism = false,
    this.glassBlur,
    this.glassBackgroundColor,
    this.glassBorderColor,
  });

  final ButtonVariant variant;
  final Widget? icon;
  final IconAlignment iconAlignment;
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool useGlassmorphism;
  final double? glassBlur;
  final Color? glassBackgroundColor;
  final Color? glassBorderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: uiConstants.spacing4),
      child: Semantics(
        button: true,
        enabled: onPressed != null && !isLoading,
        label: label,
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            final isDark = themeProvider.isDarkMode;
            final theme = themeProvider.currentTheme;
            final glassTheme = theme.extension<GlassTheme>();

            final Color focusColor =
                glassTheme?.focusColor ?? theme.colorScheme.primary;

            // Custom loading widget
            Widget loadingWidget = SizedBox(
              width: uiConstants.spacing4,
              height: uiConstants.spacing4,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  isDark
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.primary,
                ),
              ),
            );

            Widget buttonLabel = isLoading ? loadingWidget : Text(label);

            List<Widget> children = [];
            if (icon != null) {
              if (iconAlignment == IconAlignment.start) {
                children = [
                  icon!,
                  SizedBox(width: uiConstants.spacing2),
                  buttonLabel,
                ];
              } else {
                children = [
                  buttonLabel,
                  SizedBox(width: uiConstants.spacing2),
                  icon!,
                ];
              }
            } else {
              children = [buttonLabel];
            }

            Widget buttonChild = Row(
              mainAxisSize: MainAxisSize.min,
              children: children,
            );

            final BorderRadius glassRadius = BorderRadius.circular(
              glassTheme?.control.radius ?? uiConstants.radius16,
            );

            // Glassmorphism button variant
            if (variant == ButtonVariant.glass || useGlassmorphism) {
              return GlassmorphismContainer(
                variant: GlassSurfaceVariant.control,
                width: double.infinity,
                padding: glassTheme?.control.padding,
                backgroundColor: glassBackgroundColor,
                blurAmount: glassBlur ?? glassTheme?.control.blur,
                borderRadius: glassRadius,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: isLoading ? null : onPressed,
                    borderRadius: glassRadius,
                    focusColor: focusColor.withValues(alpha: 0.15),
                    hoverColor: focusColor.withValues(alpha: 0.08),
                    highlightColor: focusColor.withValues(alpha: 0.12),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: uiConstants.spacing1,
                        ),
                        child: buttonChild,
                      ),
                    ),
                  ),
                ),
              );
            }

            ButtonStyle? style;
            // Customize style based on theme and variant
            switch (variant) {
              case ButtonVariant.primary:
                return ElevatedButton(
                  onPressed: isLoading ? null : onPressed,
                  style: style,
                  child: buttonChild,
                );

              case ButtonVariant.secondary:
                return OutlinedButton(
                  onPressed: isLoading ? null : onPressed,
                  style: style,
                  child: buttonChild,
                );

              case ButtonVariant.text:
                return TextButton(
                  onPressed: isLoading ? null : onPressed,
                  style: style,
                  child: buttonChild,
                );

              case ButtonVariant.glass:
                return GlassmorphismContainer(
                  variant: GlassSurfaceVariant.control,
                  width: double.infinity,
                  padding: glassTheme?.control.padding,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: isLoading ? null : onPressed,
                      borderRadius: glassRadius,
                      focusColor: focusColor.withValues(alpha: 0.15),
                      hoverColor: focusColor.withValues(alpha: 0.08),
                      highlightColor: focusColor.withValues(alpha: 0.12),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: uiConstants.spacing1,
                          ),
                          child: buttonChild,
                        ),
                      ),
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
