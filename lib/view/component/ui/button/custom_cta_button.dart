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
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          final isDark = themeProvider.isDarkMode;
          final theme = themeProvider.currentTheme;

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

          // Glassmorphism button variant
          if (variant == ButtonVariant.glass || useGlassmorphism) {
            return GlassmorphismContainer(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: uiConstants.spacing6,
                vertical: uiConstants.spacing4,
              ),
              backgroundColor: glassBackgroundColor,
              blurAmount: glassBlur,
              child: InkWell(
                onTap: isLoading ? null : onPressed,
                borderRadius: BorderRadius.circular(uiConstants.radius16),
                child: Center(child: buttonChild),
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
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: uiConstants.spacing6,
                  vertical: uiConstants.spacing4,
                ),
                child: InkWell(
                  onTap: isLoading ? null : onPressed,
                  borderRadius: BorderRadius.circular(uiConstants.radius16),
                  child: Center(child: buttonChild),
                ),
              );
          }
        },
      ),
    );
  }
}
