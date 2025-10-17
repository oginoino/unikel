import '../../utils/imports/common_libs.dart';
import '../component/ui/avatar/user_avatar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final l10n = context.l10n;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ResponsivePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: uiConstants.spacing8),
              Text(
                appConstants.appName,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: uiConstants.spacing2),
              Text(
                l10n.onboarding_subtitle,
                style: textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: uiConstants.spacing6),
              Consumer<UserDataProvider>(
                builder: (context, provider, _) {
                  final user = provider.currentUser;
                  final String titleText =
                      user?.consumerProfile?.name ??
                      user?.email ??
                      l10n.profileTitle;

                  return Card(
                    elevation: uiConstants.elevation2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        uiConstants.radius16,
                      ),
                    ),
                    margin: EdgeInsets.zero,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(
                        uiConstants.radius16,
                      ),
                      onTap: () => context.push(Routes.profile),
                      child: Padding(
                        padding: EdgeInsets.all(uiConstants.spacing4),
                        child: Row(
                          children: [
                            UserAvatar(
                              size: 64,
                              onTap: null,
                              showTooltip: false,
                            ),
                            SizedBox(width: uiConstants.spacing4),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    titleText,
                                    style: textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: uiConstants.spacing1),
                                  Text(
                                    l10n.profileSubtitle,
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: theme.colorScheme
                                          .onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: uiConstants.spacing10),
            ],
          ),
        ),
      ),
    );
  }
}
