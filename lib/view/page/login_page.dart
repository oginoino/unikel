import '../../utils/imports/common_libs.dart';
import '../component/ui/forms/login_form.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: ResponsivePadding(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: uiConstants.spacing8),
              child: const LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}
