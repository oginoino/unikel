import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
              Padding(
                padding: const EdgeInsets.all(16.0),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu nome';
                          }
                          return null;
                        },
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
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu telefone';
                          }
                          // Basic phone number validation (e.g., digits only)
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
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
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira o código do telefone';
                          }
                          // Basic phone code validation (e.g., digits only and specific length)
                          if (!RegExp(r'^[0-9]{4}$').hasMatch(value)) {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_currentPage > 0)
              ElevatedButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                child: const Text('Anterior'),
              ),
            if (_currentPage < 2) // Assuming 3 pages
              ElevatedButton(
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
          ],
        ),
      ],
    );
  }
}
