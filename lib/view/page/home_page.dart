import '../../model/user_data.dart';
import '../../utils/imports/common_libs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.register),
      ),
      body: Consumer<UserDataProvider>(
        builder: (context, userDataProvider, _) {
          if (userDataProvider.isLoading &&
              userDataProvider.registeredUsers.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (userDataProvider.errorMessage != null) {
            return Center(
              child: Text(
                userDataProvider.errorMessage ?? '',
                style: textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }

          if (userDataProvider.registeredUsers.isEmpty) {
            return Center(
              child: Text(
                'Nenhum usuário registrado.',
                style: textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            );
          }

          final currentUser = userDataProvider.currentUser;

          return ListView(
            padding: EdgeInsets.all(uiConstants.spacing4),
            children: [
              if (currentUser != null)
                Card(
                  margin: EdgeInsets.only(bottom: uiConstants.spacing4),
                  child: Padding(
                    padding: EdgeInsets.all(uiConstants.spacing6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Usuário atual',
                          style: textTheme.titleLarge,
                        ),
                        SizedBox(height: uiConstants.spacing2),
                        _UserDetails(user: currentUser),
                      ],
                    ),
                  ),
                ),
              Text(
                'Usuários registrados',
                style: textTheme.titleMedium,
              ),
              SizedBox(height: uiConstants.spacing2),
              ...userDataProvider.registeredUsers.map(
                (user) => Card(
                  margin: EdgeInsets.only(bottom: uiConstants.spacing3),
                  child: Padding(
                    padding: EdgeInsets.all(uiConstants.spacing5),
                    child: _UserDetails(user: user),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _UserDetails extends StatelessWidget {
  const _UserDetails({required this.user});

  final UserData user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final profile = user.consumerProfile;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ID: ${user.id}',
          style: textTheme.bodyMedium,
        ),
        if (profile?.name != null) ...[
          SizedBox(height: uiConstants.spacing1),
          Text(
            'Nome: ${profile!.name}',
            style: textTheme.bodyMedium,
          ),
        ],
        if (user.email != null) ...[
          SizedBox(height: uiConstants.spacing1),
          Text(
            'Email: ${user.email}',
            style: textTheme.bodyMedium,
          ),
        ],
        SizedBox(height: uiConstants.spacing1),
        Text(
          'Telefone: ${profile?.phone ?? '---'}',
          style: textTheme.bodyMedium,
        ),
        SizedBox(height: uiConstants.spacing1),
        Text(
          'Permissões: ${user.effectivePermissions.join(', ')}',
          style: textTheme.bodySmall,
        ),
      ],
    );
  }
}
