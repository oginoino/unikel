import '../../../../utils/imports/common_libs.dart';
import '../avatar/user_avatar.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.showAuthenticatedActions,
    required this.isProfileRoute,
  });

  final bool showAuthenticatedActions;
  final bool isProfileRoute;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataProvider>(
      builder: (context, userProvider, _) {
        final bool hasUser = userProvider.hasUser;
        final bool showAvatar =
            showAuthenticatedActions && hasUser && !isProfileRoute;
        final bool showGlobalControls = !showAuthenticatedActions;

        final actions = <Widget>[];
        if (showGlobalControls) {
          actions.addAll(const [
            LanguageSelector(),
            ThemeToggleButton(),
          ]);
        }
        if (showAvatar) {
          actions.add(
            UserAvatar(
              onTap: () => context.push(Routes.profile),
            ),
          );
        }
        if (actions.isNotEmpty) {
          actions.add(SizedBox(width: uiConstants.spacing2));
        }

        return SliverAppBar(
          title: Text(appConstants.appName),
          floating: true,
          snap: true,
          actions: actions,
        );
      },
    );
  }
}
