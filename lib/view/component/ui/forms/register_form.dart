import 'package:flutter/material.dart';
import 'package:unikel/config/di.dart';
import 'package:unikel/view/component/ui/padding/responsive_padding.dart';

import '../../../../utils/form_validators.dart';

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
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => FormValidators.validateRequired(
                          value,
                          'Nome',
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
                        decoration: const InputDecoration(
                          labelText: 'Telefone',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          final requiredError = FormValidators.validateRequired(
                            value,
                            'Telefone',
                            context,
                          );
                          if (requiredError != null) {
                            return requiredError;
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
                            return 'Por favor, insira apenas dígitos';
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
                        decoration: const InputDecoration(
                          labelText: 'Código do Telefone',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          final requiredError = FormValidators.validateRequired(
                            value,
                            'Código do Telefone',
                            context,
                          );
                          if (requiredError != null) {
                            return requiredError;
                          }
                          if (!RegExp(r'^[0-9]{4}$').hasMatch(value!)) {
                            return 'Por favor, insira um código de 4 dígitos';
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: const Text('Anterior'),
                    ),
                  ),
                if (_currentPage < 2) // Assuming 3 pages
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKeys[_currentPage].currentState!.validate()) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: const Text('Próximo'),
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
