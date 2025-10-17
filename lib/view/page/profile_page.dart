import '../../utils/imports/common_libs.dart';
import '../component/ui/avatar/user_avatar.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final l10n = context.l10n;

    return Consumer<UserDataProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading && provider.currentUser == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = provider.currentUser;
        if (user == null) {
          return _ProfileEmptyState(message: l10n.profileMissingData);
        }

        final consumerProfile = user.consumerProfile;
        final bool isActive = user.isActive;
        final bool isPhoneVerified = user.isPhoneVerified;
        final String displayName = consumerProfile?.name ??
            user.email ??
            l10n.profileMissingData;
        final String email =
            user.email ?? l10n.profileMissingData;
        final String phone =
            user.phoneNumber ?? l10n.profileMissingData;

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ResponsivePadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: uiConstants.spacing8),
                Text(
                  l10n.profileTitle,
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: uiConstants.spacing2),
                Text(
                  l10n.profileSubtitle,
                  style: textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: uiConstants.spacing3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const LanguageSelector(),
                    SizedBox(width: uiConstants.spacing2),
                    const ThemeToggleButton(),
                  ],
                ),
                SizedBox(height: uiConstants.spacing6),
                Center(
                  child: UserAvatar(
                    size: 96,
                    onTap: null,
                    showTooltip: false,
                  ),
                ),
                SizedBox(height: uiConstants.spacing3),
                Center(
                  child: Text(
                    displayName,
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: uiConstants.spacing1),
                Center(
                  child: Text(
                    email,
                    style: textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: uiConstants.spacing6),
                Text(
                  l10n.profileAccountSectionTitle,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: uiConstants.spacing2),
                _ProfileInfoCard(
                  children: [
                    _ProfileInfoRow(
                      icon: Icons.confirmation_number_outlined,
                      label: l10n.profileIdLabel,
                      value: user.id,
                    ),
                    SizedBox(height: uiConstants.spacing4),
                    _ProfileInfoRow(
                      icon: Icons.person_outline_rounded,
                      label: l10n.labelName,
                      value:
                          consumerProfile?.name ?? l10n.profileMissingData,
                    ),
                    SizedBox(height: uiConstants.spacing4),
                    _ProfileInfoRow(
                      icon: Icons.email_outlined,
                      label: l10n.profileEmailLabel,
                      value: email,
                    ),
                    SizedBox(height: uiConstants.spacing4),
                    Wrap(
                      spacing: uiConstants.spacing2,
                      runSpacing: uiConstants.spacing2,
                      children: [
                        _buildStatusChip(
                          context,
                          icon: Icons.verified_user_outlined,
                          label: isActive
                              ? l10n.profileStatusActive
                              : l10n.profileStatusInactive,
                          color: isActive
                              ? theme.colorScheme.primary
                              : theme.colorScheme.error,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: uiConstants.spacing6),
                Text(
                  l10n.profileContactSectionTitle,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: uiConstants.spacing2),
                _ProfileInfoCard(
                  children: [
                    _ProfileInfoRow(
                      icon: Icons.phone_outlined,
                      label: l10n.labelPhone,
                      value: phone,
                    ),
                    SizedBox(height: uiConstants.spacing4),
                    Wrap(
                      spacing: uiConstants.spacing2,
                      runSpacing: uiConstants.spacing2,
                      children: [
                        _buildStatusChip(
                          context,
                          icon: isPhoneVerified
                              ? Icons.verified_outlined
                              : Icons.error_outline_rounded,
                          label: isPhoneVerified
                              ? l10n.profilePhoneVerified
                              : l10n.profilePhoneUnverified,
                          color: isPhoneVerified
                              ? theme.colorScheme.tertiary
                              : theme.colorScheme.error,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: uiConstants.spacing10),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusChip(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
  }) {
    final theme = Theme.of(context);
    return Chip(
      avatar: Icon(
        icon,
        color: color,
        size: uiConstants.spacing4,
      ),
      side: BorderSide.none,
      backgroundColor: color.withValues(alpha: 0.12),
      label: Text(
        label,
        style: theme.textTheme.labelMedium?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: uiConstants.spacing2,
        vertical: uiConstants.spacing1,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

class _ProfileInfoCard extends StatelessWidget {
  const _ProfileInfoCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: uiConstants.elevation2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(uiConstants.radius16),
      ),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(uiConstants.spacing4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: uiConstants.spacing7,
          height: uiConstants.spacing7,
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(uiConstants.radius12),
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: colorScheme.primary,
            size: uiConstants.spacing4,
          ),
        ),
        SizedBox(width: uiConstants.spacing3),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: uiConstants.spacing1),
              Text(
                value,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileEmptyState extends StatelessWidget {
  const _ProfileEmptyState({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: ResponsivePadding(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.person_outline_rounded,
              color: theme.colorScheme.onSurfaceVariant,
              size: uiConstants.spacing10,
            ),
            SizedBox(height: uiConstants.spacing3),
            Text(
              message,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
