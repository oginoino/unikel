import 'package:unikel/utils/imports/common_libs.dart';

import '../button/custom_cta_button.dart';

class CtaToRegisterScreen extends StatelessWidget {
  const CtaToRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: uiConstants.spacing4,
        children: [
          CustomCTAButton(
            variant: ButtonVariant.primary,
            label: context.l10n.register,
            onPressed: () {
              // context.go(Routes.register);
            },
          ),
          CustomCTAButton(
            variant: ButtonVariant.secondary,
            label: context.l10n.login,
            onPressed: () {
              // context.go(Routes.login);
            },
          ),
        ],
      ),
    );
  }
}
