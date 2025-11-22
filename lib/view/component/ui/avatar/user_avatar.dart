import '../../../../model/user_model.dart';
import '../../../../utils/imports/common_libs.dart';
import '../glassmorphism/glass_container.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    this.size = 40,
    this.onTap,
    this.showTooltip = true,
    this.useGlassmorphism = false,
    this.glassBlur,
    this.glassBackgroundColor,
    this.glassBorderColor,
  });

  static const String heroTag = 'user-avatar-hero';

  final double size;
  final VoidCallback? onTap;
  final bool showTooltip;
  final bool useGlassmorphism;
  final double? glassBlur;
  final Color? glassBackgroundColor;
  final Color? glassBorderColor;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataProvider>(
      builder: (context, provider, _) {
        final theme = Theme.of(context);
        final user = provider.currentUser;
        final bool isLoading = provider.isLoading && user == null;
        final String? initials = _extractInitials(user);

        final Color backgroundColor = user != null
            ? theme.colorScheme.primaryContainer
            : theme.colorScheme.surfaceContainerHighest;
        final Color foregroundColor = theme.colorScheme.primary;

        Widget avatarContents;
        if (isLoading) {
          avatarContents = SizedBox(
            key: const ValueKey<String>('avatar-loading'),
            width: size * 0.4,
            height: size * 0.4,
            child: CircularProgressIndicator(
              strokeWidth: uiConstants.borderWidth2,
              valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
            ),
          );
        } else if (initials != null) {
          avatarContents = Text(
            key: ValueKey<String>('avatar-$initials'),
            initials,
            style: theme.textTheme.titleMedium?.copyWith(
              color: foregroundColor,
              fontWeight: FontWeight.w600,
            ),
          );
        } else {
          avatarContents = Icon(
            key: const ValueKey<String>('avatar-icon'),
            Icons.person_outline_rounded,
            color: foregroundColor,
            size: size * 0.6,
          );
        }

        final borderRadius = BorderRadius.circular(size);
        final animationDuration = Duration(
          milliseconds: uiConstants.animationDurationDefault,
        );

        Widget avatar;
        if (useGlassmorphism) {
          avatar = Hero(
            tag: heroTag,
            child: GlassmorphismContainer(
              borderRadius: BorderRadius.circular(size),
              width: size,
              height: size,
              blurAmount: glassBlur,
              backgroundColor: glassBackgroundColor,
              child: AnimatedSwitcher(
                duration: animationDuration,
                child: avatarContents,
              ),
            ),
          );
        } else {
          avatar = Hero(
            tag: heroTag,
            child: AnimatedContainer(
              duration: animationDuration,
              curve: Curves.easeInOut,
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: borderRadius,
                border: Border.all(
                  color: theme.colorScheme.primary.withValues(alpha: 0.35),
                  width: uiConstants.borderWidth1,
                ),
              ),
              alignment: Alignment.center,
              child: AnimatedSwitcher(
                duration: animationDuration,
                child: avatarContents,
              ),
            ),
          );
        }

        Widget tappableAvatar = Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: user != null ? onTap : null,
            borderRadius: borderRadius,
            child: Padding(
              padding: EdgeInsets.all(uiConstants.spacing1),
              child: avatar,
            ),
          ),
        );

        if (!showTooltip) {
          return tappableAvatar;
        }

        final tooltipLabel = AppLocalizations.of(context).profileTooltip;
        return Tooltip(
          message: tooltipLabel,
          waitDuration: Duration(
            milliseconds: uiConstants.tooltipWaitDurationMs,
          ),
          showDuration: Duration(
            milliseconds: uiConstants.tooltipShowDurationMs,
          ),
          child: tappableAvatar,
        );
      },
    );
  }

  String? _extractInitials(UserData? user) {
    final source = user?.consumerProfile?.name ?? user?.email;
    if (source == null) {
      return null;
    }
    final trimmed = source.trim();
    if (trimmed.isEmpty) {
      return null;
    }
    final parts = trimmed.split(RegExp(r'\s+'));
    String takeFirstLetter(String value) =>
        value.isEmpty ? '' : value.substring(0, 1);

    if (parts.length == 1) {
      final name = parts.first;
      if (name.length == 1) {
        return name.toUpperCase();
      }
      final first = takeFirstLetter(name);
      final second = takeFirstLetter(name.substring(1));
      return ('$first$second').toUpperCase();
    }
    final buffer = StringBuffer();
    buffer.write(takeFirstLetter(parts.first));
    buffer.write(takeFirstLetter(parts.last));
    return buffer.toString().toUpperCase();
  }
}
