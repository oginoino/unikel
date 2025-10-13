import 'package:unikel/view/component/ui/button/custom_cta_button.dart';

import '../../../../utils/form_validators.dart';
import '../../../../utils/imports/common_libs.dart';
import '../padding/responsive_padding.dart';

class RegisterUserForm extends StatefulWidget {
  const RegisterUserForm({super.key});

  @override
  State<RegisterUserForm> createState() => _RegisterUserFormState();
}

class _RegisterUserFormState extends State<RegisterUserForm> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _phoneCodeController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _phoneCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(), // Disable swiping
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              // Page 1: Name Input
              ResponsivePadding(
                child: Form(
                  key: _formKeys[0],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: context.l10n.labelName,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => FormValidators.validateRequired(
                          value,
                          context.l10n.nameValue,
                          context,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Page 2: Phone Input
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKeys[1],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: context.l10n.labelPhone,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          final requiredError = FormValidators.validateRequired(
                            value,
                            context.l10n.phoneValue,
                            context,
                          );
                          if (requiredError != null) {
                            return requiredError;
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
                            return context.l10n.invalidPhoneMatch;
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // Page 3: Phone Code Input
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKeys[2],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _phoneCodeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: context.l10n.labelPhoneCode,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          final requiredError = FormValidators.validateRequired(
                            value,
                            context.l10n.phoneCodeValue,
                            context,
                          );
                          if (requiredError != null) {
                            return requiredError;
                          }
                          if (!RegExp(r'^[0-9]{4}$').hasMatch(value!)) {
                            return context.l10n.invalidPhoneCodeMatch;
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: uiConstants.spacing4,
            vertical: uiConstants.spacing20,
          ),
          child: SizedBox(
            height: 50.0, // Define uma altura fixa para o Row dos botões
            child: Row(
              spacing: uiConstants.spacing4,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  Expanded(
                    child: CustomCTAButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      variant: ButtonVariant.secondary,
                      label: context.l10n.previous,
                      icon: Icon(Icons.arrow_back_rounded),
                    ),
                  ),
                if (_currentPage < _formKeys.length - 1) // Assuming 3 pages
                  Expanded(
                    child: CustomCTAButton(
                      onPressed: () {
                        if (_formKeys[_currentPage].currentState!.validate()) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      icon: Icon(Icons.arrow_forward_rounded),
                      variant: ButtonVariant.primary,
                      label: context.l10n.next,
                    ),
                  ),
                // Page 4: Submit Button
                if (_currentPage == _formKeys.length - 1)
                  Expanded(
                    child: CustomCTAButton(
                      onPressed: () {
                        if (_formKeys[_currentPage].currentState!.validate()) {
                          // Submit the form
                          // For example: _submitForm();
                        }
                      },
                      variant: ButtonVariant.primary,
                      label: context.l10n.submitRegister,
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
