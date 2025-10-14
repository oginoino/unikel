import 'package:unikel/view/component/ui/button/custom_cta_button.dart';
import 'package:unikel/view/component/ui/page_indicator/page_indicator.dart';

import '../../../../utils/form_validators.dart';
import '../../../../utils/imports/common_libs.dart';
import '../padding/responsive_padding.dart';
import 'package:country_code_picker/country_code_picker.dart';

class RegisterUserForm extends StatefulWidget {
  const RegisterUserForm({super.key});

  @override
  State<RegisterUserForm> createState() => _RegisterUserFormState();
}

class _RegisterUserFormState extends State<RegisterUserForm> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  CountryCode _selectedCountryCode = CountryCode.fromCountryCode('BR');
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _phoneCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneCodeController.text = _selectedCountryCode.dialCode ?? '';
  }

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: uiConstants.spacing16),
                    Text(
                      context.l10n.registerNameTitle,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: uiConstants.spacing16),
                    Form(
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
                            validator: (value) =>
                                FormValidators.validateRequired(
                                  value,
                                  context.l10n.nameValue,
                                  context,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Page 2: Phone Input
              ResponsivePadding(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: uiConstants.spacing16),
                    Text(
                      context.l10n.registerPhoneTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: uiConstants.spacing16),
                    Padding(
                      padding: EdgeInsets.all(uiConstants.spacing4),
                      child: Form(
                        key: _formKeys[1],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 92,
                                  child: CountryCodePicker(
                                    dialogTextStyle: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                    dialogBackgroundColor: Theme.of(
                                      context,
                                    ).canvasColor,
                                    headerText: context.l10n.selectCountryCode,
                                    boxDecoration: BoxDecoration(
                                      border: Border.all(
                                        color: Theme.of(context).dividerColor,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        uiConstants.spacing2,
                                      ),
                                    ),
                                    flagWidth: uiConstants.spacing4,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: uiConstants.spacing1,
                                    ),
                                    textStyle: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                    onChanged: (countryCode) {
                                      setState(() {
                                        _selectedCountryCode = countryCode;
                                        _phoneCodeController.text =
                                            countryCode.dialCode ?? '';
                                      });
                                    },
                                    initialSelection: _selectedCountryCode.code,
                                    favorite: const ['+55', 'BR'],
                                    showCountryOnly: false,
                                    showOnlyCountryWhenClosed: false,
                                    alignLeft: true,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: _phoneController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      labelText: context.l10n.labelPhone,
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) =>
                                        FormValidators.validatePhone(
                                          value,
                                          context,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Page 3: Phone Code Input
              ResponsivePadding(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: uiConstants.spacing16),
                    Text(
                      context.l10n.registerSecurityCodeTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: uiConstants.spacing16),
                    Padding(
                      padding: EdgeInsets.all(uiConstants.spacing4),
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
                                labelText: context.l10n.labelSecurityCode,
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) =>
                                  FormValidators.validateRequired(
                                    value,
                                    context.l10n.labelSecurityCode,
                                    context,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        PageIndicator(currentPage: _currentPage, itemCount: _formKeys.length),
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
