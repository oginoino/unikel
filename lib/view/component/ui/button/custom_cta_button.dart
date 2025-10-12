import '../../../../utils/imports/common_libs.dart';

enum ButtonVariant { primary, secondary, text }

class CustomCTAButton extends StatelessWidget {
  const CustomCTAButton({
    super.key,
    this.variant = ButtonVariant.primary,
    this.icon,
    this.iconAlignment = IconAlignment.start,
    required this.label,
    this.onPressed,
    this.isLoading = false,
  });

  final ButtonVariant variant;
  final Widget? icon;
  final IconAlignment iconAlignment;
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: uiConstants.spacing4),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          final isDark = themeProvider.isDarkMode;

          // Custom loading widget
          Widget loadingWidget = SizedBox(
            width: uiConstants.spacing4,
            height: uiConstants.spacing4,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                isDark
                    ? themeProvider.currentTheme.colorScheme.onSurface
                    : themeProvider.currentTheme.colorScheme.primary,
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
          }
        },
      ),
    );
  }
}
