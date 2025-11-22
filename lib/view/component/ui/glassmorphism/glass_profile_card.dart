import '../../../../utils/imports/common_libs.dart';
import 'glass_container.dart';
import '../../../../model/user_model.dart';

class GlassmorphismProfileCard extends StatelessWidget {
  const GlassmorphismProfileCard({
    super.key,
    required this.user,
    this.onTap,
    this.glassBlur,
    this.glassBackgroundColor,
    this.glassBorderColor,
  });

  final UserData user;
  final VoidCallback? onTap;
  final double? glassBlur;
  final Color? glassBackgroundColor;
  final Color? glassBorderColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String? initials = _extractInitials(user);

    return GlassmorphismContainer(
      padding: EdgeInsets.all(uiConstants.spacing6),
      blurAmount: glassBlur,
      backgroundColor: glassBackgroundColor,
      borderRadius: BorderRadius.circular(uiConstants.radius12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(uiConstants.radius12),
        child: Row(
          children: [
            // Avatar
            GlassmorphismContainer(
              borderRadius: BorderRadius.circular(40),
              width: 60,
              height: 60,
              blurAmount: glassBlur,
              backgroundColor: glassBackgroundColor,
              child: Center(
                child: initials != null
                    ? Text(
                        initials,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : Icon(
                        Icons.person_outline_rounded,
                        color: theme.colorScheme.primary,
                        size: 30,
                      ),
              ),
            ),
            SizedBox(width: uiConstants.spacing4),
            // User Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.consumerProfile?.name ?? user.email ?? 'Unknown User',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (user.consumerProfile?.phone != null) ...[
                    SizedBox(height: uiConstants.spacing1),
                    Text(
                      user.consumerProfile?.phone ?? '',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (user.email != null) ...[
                    SizedBox(height: uiConstants.spacing1),
                    Text(
                      user.email!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            // Arrow Icon
            Icon(
              Icons.chevron_right_rounded,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  String? _extractInitials(UserData user) {
    final source = user.consumerProfile?.name ?? user.email;
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
