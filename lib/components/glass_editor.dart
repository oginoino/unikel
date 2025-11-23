import 'package:flutter/material.dart';
import 'package:glassy/components/glass_input.dart';
import 'package:glassy/utils/constants/ui_constants.dart';

class GlassEditor extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int maxLength;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;
  final FocusNode? focusNode;

  const GlassEditor({
    super.key,
    this.controller,
    this.hintText = "What are you thinking?",
    this.maxLength = 500,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
  });

  @override
  State<GlassEditor> createState() => _GlassEditorState();
}

class _GlassEditorState extends State<GlassEditor> {
  late TextEditingController _controller;
  late int _currentLength;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _currentLength = _controller.text.length;
    _controller.addListener(_updateLength);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_updateLength);
    }
    super.dispose();
  }

  void _updateLength() {
    setState(() {
      _currentLength = _controller.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final uiConstants = UIConstants();

    // Calculate progress for the counter ring
    final double progress = _currentLength / widget.maxLength;
    final bool isNearLimit = progress > 0.9;
    final bool isAtLimit = _currentLength >= widget.maxLength;

    final Color counterColor = isAtLimit
        ? theme.colorScheme.error
        : (isNearLimit
              ? theme.colorScheme.tertiary
              : theme.colorScheme.onSurface.withValues(alpha: 0.4));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        GlassInput(
          controller: _controller,
          focusNode: widget.focusNode,
          hintText: widget.hintText,
          maxLines: 10,
          minLines: 5,
          maxLength: widget.maxLength,
          showCounter: false, // We use our own custom counter
          onChanged: widget.onChanged,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          height: 200, // Fixed height for the editor area
          contentPadding: const EdgeInsets.all(24),
          textStyle: theme.textTheme.bodyLarge?.copyWith(
            fontSize: 18,
            height: 1.5,
            fontWeight: FontWeight.w400,
          ),
          // Make it look cleaner
          fillColor: isDark
              ? uiConstants.glassBlackSeeThrough
              : uiConstants.glassWhiteSeeThrough,
          blurAmount: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _currentLength > 0 ? 1.0 : 0.0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 2,
                    backgroundColor: theme.colorScheme.onSurface.withValues(
                      alpha: 0.1,
                    ),
                    valueColor: AlwaysStoppedAnimation<Color>(counterColor),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${widget.maxLength - _currentLength}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: counterColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
