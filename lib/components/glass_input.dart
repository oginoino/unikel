import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glassy/view/theme/glass_theme_extention.dart';

import '../utils/constants/ui_constants.dart';
import '../view/component/ui/glassmorphism/glass_container.dart';

class GlassInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final double height;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool isDense;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? blurAmount;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool expands;
  final int? maxLength;
  final bool showCounter;
  final Color? cursorColor;
  final double cursorWidth;
  final Radius? cursorRadius;
  final List<String>? autofillHints;
  final String? semanticsLabel;
  final TextInputAction? textInputAction;

  const GlassInput({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.height = 56.0,
    this.borderRadius,
    this.contentPadding,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.isDense = false,
    this.fillColor,
    this.borderColor,
    this.borderWidth,
    this.blurAmount,
    this.autoFocus = false,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.expands = false,
    this.maxLength,
    this.showCounter = false,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.autofillHints,
    this.semanticsLabel,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final uiConstants = UIConstants();
    final isDark = theme.brightness == Brightness.dark;
    final glassTheme = theme.extension<GlassTheme>();

    final double effectiveBorderRadius =
        borderRadius ??
            glassTheme?.control.radius ??
            uiConstants.glassInputBorderRadius;
    final double effectiveBorderWidth =
        borderWidth ??
            glassTheme?.control.borderWidth ??
            uiConstants.glassBorderWidthThin;
    final double effectiveBlur =
        blurAmount ??
            glassTheme?.control.blur ??
            uiConstants.glassInputBlurAmount;

    // Cores padrão baseadas no tema
    final defaultFillColor =
        fillColor ??
        (isDark
            ? uiConstants.glassBlackSeeThrough
            : uiConstants.glassWhiteSeeThrough);

    final defaultTextStyle =
        textStyle ??
        theme.textTheme.bodyLarge?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ) ??
        TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: isDark ? Colors.white : Colors.black,
        );

    final defaultHintStyle =
        hintStyle ??
        theme.textTheme.bodyLarge?.copyWith(
          fontSize: 16,
          color: isDark
              ? theme.colorScheme.onSurface.withValues(alpha: 0.6)
              : theme.colorScheme.onSurface.withValues(alpha: 0.5),
          fontWeight: FontWeight.w400,
        );

    final defaultLabelStyle =
        labelStyle ??
        theme.textTheme.bodyMedium?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: isDark
              ? theme.colorScheme.onSurface.withValues(alpha: 0.8)
              : theme.colorScheme.onSurface.withValues(alpha: 0.7),
        );

    final defaultCursorColor = cursorColor ?? theme.colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null) ...[
          Text(labelText!, style: defaultLabelStyle),
          const SizedBox(height: 8),
        ],
        GlassmorphismContainer(
          variant: GlassSurfaceVariant.control,
          blurAmount: effectiveBlur,
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
          borderWidth: effectiveBorderWidth,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: defaultFillColor,
              borderRadius: BorderRadius.circular(effectiveBorderRadius),
            ),
            child: Semantics(
              label: semanticsLabel ?? labelText ?? hintText,
              textField: true,
              enabled: enabled,
              child: TextFormField(
                controller: controller,
                obscureText: obscureText,
                keyboardType: keyboardType,
                inputFormatters: inputFormatters,
                validator: validator,
                onChanged: onChanged,
                onFieldSubmitted: onSubmitted,
                enabled: enabled,
                maxLines: maxLines,
                minLines: minLines,
                autofocus: autoFocus,
                focusNode: focusNode,
                textAlign: textAlign,
                textAlignVertical:
                    textAlignVertical ?? TextAlignVertical.center,
                expands: expands,
                maxLength: maxLength,
                cursorColor: defaultCursorColor,
                cursorWidth: cursorWidth,
                cursorRadius: cursorRadius ?? const Radius.circular(2),
                autofillHints: autofillHints,
                textInputAction: textInputAction,
                style: defaultTextStyle.copyWith(
                  color: enabled
                      ? (defaultTextStyle.color ??
                          theme.colorScheme.onSurface)
                      : theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: defaultHintStyle,
                  prefixIcon: prefixIcon != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 16, right: 12),
                          child: IconTheme(
                            data: IconThemeData(
                              size: 20,
                              color: isDark
                                  ? theme.colorScheme.onSurface.withValues(
                                      alpha: 0.7,
                                    )
                                  : theme.colorScheme.onSurface.withValues(
                                      alpha: 0.6,
                                    ),
                            ),
                            child: prefixIcon!,
                          ),
                        )
                      : null,
                  suffixIcon: suffixIcon != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 12, right: 16),
                          child: IconTheme(
                            data: IconThemeData(
                              size: 20,
                              color: isDark
                                  ? theme.colorScheme.onSurface.withValues(
                                      alpha: 0.7,
                                    )
                                  : theme.colorScheme.onSurface.withValues(
                                      alpha: 0.6,
                                    ),
                            ),
                            child: suffixIcon!,
                          ),
                        )
                      : null,
                  contentPadding:
                      contentPadding ??
                      EdgeInsets.symmetric(
                        horizontal: prefixIcon != null ? 12 : 20,
                        vertical: isDense ? 8 : 16,
                      ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  isDense: isDense,
                  counterText: showCounter ? null : '',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GlassInputPassword extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool enabled;
  final double height;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool isDense;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? blurAmount;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final int? maxLength;
  final bool showCounter;
  final Color? cursorColor;
  final double cursorWidth;
  final Radius? cursorRadius;
  final List<String>? autofillHints;
  final String? semanticsLabel;
  final TextInputAction? textInputAction;

  const GlassInputPassword({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.height = 56.0,
    this.borderRadius,
    this.contentPadding,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.isDense = false,
    this.fillColor,
    this.borderColor,
    this.borderWidth,
    this.blurAmount,
    this.autoFocus = false,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.showCounter = false,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.autofillHints,
    this.semanticsLabel,
    this.textInputAction,
  });

  @override
  State<GlassInputPassword> createState() => _GlassInputPasswordState();
}

class _GlassInputPasswordState extends State<GlassInputPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GlassInput(
      controller: widget.controller,
      hintText: widget.hintText,
      labelText: widget.labelText,
      prefixIcon:
          widget.prefixIcon ??
          Icon(
            Icons.lock_outline,
            size: 20,
            color: isDark
                ? theme.colorScheme.onSurface.withValues(alpha: 0.7)
                : theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
      suffixIcon: GestureDetector(
        onTap: () => setState(() => _obscureText = !_obscureText),
        child: Icon(
          _obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          size: 20,
          color: isDark
              ? theme.colorScheme.onSurface.withValues(alpha: 0.7)
              : theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
      obscureText: _obscureText,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      enabled: widget.enabled,
      height: widget.height,
      borderRadius: widget.borderRadius,
      contentPadding: widget.contentPadding,
      textStyle: widget.textStyle,
      hintStyle: widget.hintStyle,
      labelStyle: widget.labelStyle,
      isDense: widget.isDense,
      fillColor: widget.fillColor,
      borderColor: widget.borderColor,
      borderWidth: widget.borderWidth,
      blurAmount: widget.blurAmount,
      autoFocus: widget.autoFocus,
      focusNode: widget.focusNode,
      textAlign: widget.textAlign,
      maxLength: widget.maxLength,
      showCounter: widget.showCounter,
      cursorColor: widget.cursorColor,
      cursorWidth: widget.cursorWidth,
      cursorRadius: widget.cursorRadius,
      autofillHints: widget.autofillHints,
      semanticsLabel: widget.semanticsLabel,
      textInputAction: widget.textInputAction,
    );
  }
}
