import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glassy/view/theme/glass_theme_extention.dart';

import '../utils/constants/ui_constants.dart';
import '../view/component/ui/glassmorphism/glass_container.dart';

class GlassInput extends StatefulWidget {
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
  State<GlassInput> createState() => _GlassInputState();
}

class _GlassInputState extends State<GlassInput>
    with SingleTickerProviderStateMixin {
  FocusNode? _ownFocusNode;
  bool _isHovered = false;
  bool _isFocused = false;
  String? _errorText;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  FocusNode get _focusNode => widget.focusNode ?? _ownFocusNode!;

  @override
  void initState() {
    super.initState();
    _ownFocusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
    _isFocused = _focusNode.hasFocus;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _animationController.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
      if (_isFocused) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void _handleHover(bool value) {
    if (_isHovered == value) return;
    setState(() {
      _isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final uiConstants = UIConstants();
    final isDark = theme.brightness == Brightness.dark;
    final glassTheme = theme.extension<GlassTheme>();

    final double effectiveBorderRadius =
        widget.borderRadius ??
        glassTheme?.control.radius ??
        uiConstants.glassInputBorderRadius;

    final double effectiveBlur =
        widget.blurAmount ??
        glassTheme?.control.blur ??
        uiConstants.glassInputBlurAmount;

    // Cores padrão baseadas no tema
    final defaultFillColor =
        widget.fillColor ??
        (isDark
            ? uiConstants.glassBlackSeeThrough
            : uiConstants.glassWhiteSeeThrough);

    final defaultTextStyle =
        widget.textStyle ??
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
        widget.hintStyle ??
        theme.textTheme.bodyLarge?.copyWith(
          fontSize: 16,
          color: isDark
              ? theme.colorScheme.onSurface.withValues(alpha: 0.6)
              : theme.colorScheme.onSurface.withValues(alpha: 0.5),
          fontWeight: FontWeight.w400,
        );

    final defaultLabelStyle =
        widget.labelStyle ??
        theme.textTheme.bodyMedium?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: isDark
              ? theme.colorScheme.onSurface.withValues(alpha: 0.8)
              : theme.colorScheme.onSurface.withValues(alpha: 0.7),
        );

    final defaultCursorColor = widget.cursorColor ?? theme.colorScheme.primary;

    final Color borderColor = _errorText != null
        ? theme.colorScheme.error
        : (_isFocused
              ? theme.colorScheme.primary
              : (_isHovered
                    ? theme.colorScheme.onSurface.withValues(alpha: 0.3)
                    : theme.colorScheme.onSurface.withValues(alpha: 0.1)));

    final double borderWidth = _isFocused || _errorText != null ? 1.5 : 1.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(widget.labelText!, style: defaultLabelStyle),
          ),
        ],
        MouseRegion(
          cursor: widget.enabled
              ? SystemMouseCursors.text
              : SystemMouseCursors.forbidden,
          onEnter: (_) => _handleHover(true),
          onExit: (_) => _handleHover(false),
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(effectiveBorderRadius),
                boxShadow: _isFocused
                    ? [
                        BoxShadow(
                          color: theme.colorScheme.primary.withValues(
                            alpha: 0.25,
                          ),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: GlassmorphismContainer(
                variant: GlassSurfaceVariant.control,
                blurAmount: effectiveBlur,
                borderRadius: BorderRadius.circular(effectiveBorderRadius),
                borderWidth: 0, // We handle border manually for better control
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: widget.height,
                  decoration: BoxDecoration(
                    color: defaultFillColor,
                    borderRadius: BorderRadius.circular(effectiveBorderRadius),
                    border: Border.all(color: borderColor, width: borderWidth),
                  ),
                  child: Semantics(
                    label:
                        widget.semanticsLabel ??
                        widget.labelText ??
                        widget.hintText,
                    textField: true,
                    enabled: widget.enabled,
                    child: TextFormField(
                      controller: widget.controller,
                      obscureText: widget.obscureText,
                      keyboardType: widget.keyboardType,
                      inputFormatters: widget.inputFormatters,
                      validator: (value) {
                        final result = widget.validator?.call(value);
                        setState(() {
                          _errorText = result;
                        });
                        return result;
                      },
                      onChanged: (value) {
                        if (_errorText != null) {
                          setState(() {
                            _errorText = null;
                          });
                        }
                        widget.onChanged?.call(value);
                      },
                      onFieldSubmitted: widget.onSubmitted,
                      enabled: widget.enabled,
                      maxLines: widget.maxLines,
                      minLines: widget.minLines,
                      autofocus: widget.autoFocus,
                      focusNode: _focusNode,
                      textAlign: widget.textAlign,
                      textAlignVertical:
                          widget.textAlignVertical ?? TextAlignVertical.center,
                      expands: widget.expands,
                      maxLength: widget.maxLength,
                      cursorColor: defaultCursorColor,
                      cursorWidth: widget.cursorWidth,
                      cursorRadius:
                          widget.cursorRadius ?? const Radius.circular(2),
                      autofillHints: widget.autofillHints,
                      textInputAction: widget.textInputAction,
                      style: defaultTextStyle.copyWith(
                        color: widget.enabled
                            ? (defaultTextStyle.color ??
                                  theme.colorScheme.onSurface)
                            : theme.colorScheme.onSurface.withValues(
                                alpha: 0.5,
                              ),
                      ),
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        hintStyle: defaultHintStyle,
                        prefixIcon: widget.prefixIcon != null
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 12,
                                ),
                                child: IconTheme(
                                  data: IconThemeData(
                                    size: 20,
                                    color: isDark
                                        ? theme.colorScheme.onSurface
                                              .withValues(alpha: 0.7)
                                        : theme.colorScheme.onSurface
                                              .withValues(alpha: 0.6),
                                  ),
                                  child: widget.prefixIcon!,
                                ),
                              )
                            : null,
                        suffixIcon: widget.suffixIcon != null
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  right: 16,
                                ),
                                child: IconTheme(
                                  data: IconThemeData(
                                    size: 20,
                                    color: isDark
                                        ? theme.colorScheme.onSurface
                                              .withValues(alpha: 0.7)
                                        : theme.colorScheme.onSurface
                                              .withValues(alpha: 0.6),
                                  ),
                                  child: widget.suffixIcon!,
                                ),
                              )
                            : null,
                        contentPadding:
                            widget.contentPadding ??
                            EdgeInsets.symmetric(
                              horizontal: widget.prefixIcon != null ? 12 : 20,
                              vertical: widget.isDense ? 8 : 16,
                            ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        isDense: widget.isDense,
                        counterText: widget.showCounter ? null : '',
                        errorStyle: const TextStyle(
                          height: 0,
                          fontSize: 0,
                        ), // Hide default error text
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (_errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 6),
            child: Text(
              _errorText!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
                fontSize: 12,
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
