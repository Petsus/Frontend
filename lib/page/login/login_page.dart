import 'package:flutter/material.dart';
import 'package:petsus/component/button/button_full.dart';
import 'package:petsus/component/textfield/textfield_app.dart';
import 'package:petsus/injection.dart';
import 'package:petsus/page/home/adm/adm_home_page.dart';
import 'package:petsus/page/login/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final LoginViewModel viewModel = getIt.get();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 128,
                height: 128,
                child: CircleAvatar(
                  radius: 64,
                  child: ClipOval(child: Image.asset('images/icon.png')),
                ),
              ),
              TextFieldApp(
                controller: emailController,
                hintText: 'Email',
                padding: const EdgeInsets.only(bottom: 16, top: 32),
              ),
              TextFieldApp(
                controller: passwordController,
                hintText: 'Senha',
                padding: const EdgeInsets.only(bottom: 16),
              ),
              ButtonFull(
                title: 'Login',
                onPressed: () => _login(context),
              ),
              const SizedBox(height: 16),
              MaterialButton(
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AdmHomePage()));
  }
}
