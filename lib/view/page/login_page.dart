import 'package:glassy/view/theme/glass_theme_extention.dart';

import '../../utils/imports/common_libs.dart';
import '../component/ui/forms/login_form.dart';
import '../component/ui/glassmorphism/glass_container.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final l10n = context.l10n;

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: _LoginBackground()),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ResponsivePadding(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: uiConstants.spacing8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Semantics(
                        header: true,
                        child: Text(
                          appConstants.appName,
                          style: textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: uiConstants.spacing2),
                      Text(
                        l10n.loginPageSubtitle,
                        style: textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(height: uiConstants.spacing6),
                      GlassmorphismContainer(
                        variant: GlassSurfaceVariant.elevated,
                        semanticLabel: l10n.loginPageTitle,
                        padding: EdgeInsets.all(uiConstants.spacing6),
                        child: const LoginForm(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginBackground extends StatelessWidget {
  const _LoginBackground();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [
                  const Color(0xFF0D1614),
                  const Color(0xFF0C1615),
                  const Color(0xFF0E1C1A),
                ]
              : [
                  const Color(0xFFE9F7F2),
                  const Color(0xFFDBEFE8),
                  const Color(0xFFD6ECE8),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          _GlassHalo(
            alignment: Alignment.topRight,
            size: 320,
            colors: [
              theme.colorScheme.primary.withValues(alpha: 0.24),
              theme.colorScheme.primaryContainer.withValues(alpha: 0.06),
            ],
          ),
          _GlassHalo(
            alignment: Alignment.bottomLeft,
            size: 380,
            colors: [
              theme.colorScheme.secondary.withValues(alpha: 0.22),
              theme.colorScheme.tertiary.withValues(alpha: 0.08),
            ],
          ),
        ],
      ),
    );
  }
}

class _GlassHalo extends StatelessWidget {
  const _GlassHalo({
    required this.alignment,
    required this.size,
    required this.colors,
  });

  final Alignment alignment;
  final double size;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: IgnorePointer(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: colors,
              center: Alignment.center,
              radius: 0.8,
            ),
          ),
        ),
      ),
    );
  }
}
