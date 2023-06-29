import 'package:flutter/material.dart';
import 'package:petsus/component/button/button_full.dart';
import 'package:petsus/component/header/header.dart';
import 'package:petsus/page/login/router/login_router.dart';
import 'package:petsus/page/login/viewmodel/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  final ILoginRouter router;
  final LoginViewModel viewModel;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({
    super.key,
    required this.router,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(left: 32, top: 60, right: 32, bottom: 16),
              child: Column(
                children: [
                  const Padding(
                    child: Header(),
                    padding: EdgeInsets.only(bottom: 36),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      hintText: 'Senha',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      onPressed: () => router.resetPassword(context),
                      child: Text(
                        'Esqueceu sua senha?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ButtonFull(
                    onPressed: () async {
                      final isLogged = await viewModel.login(_emailController.text, _passwordController.text);
                      if (isLogged) router.home(context);
                    },
                    title: 'Entrar',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Image.asset(
              'images/cat_and_dog.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
