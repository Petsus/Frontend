import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/component/button/button_full.dart';
import 'package:petsus/component/header/header.dart';
import 'package:petsus/page/login/bloc/login_bloc.dart';
import 'package:petsus/page/login/router/login_router.dart';
import 'package:petsus/page/login/viewmodel/login_viewmodel.dart';

@Injectable()
class LoginPage extends StatelessWidget {
  final AbstractLoginBloc bloc;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({
    required this.bloc,
  }): super(key: null);

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
                children: _fields(context),
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

  List<Widget> _fields(BuildContext context) {
    return [
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
          onPressed: () => bloc.resetPassword(context),
          child: Text(
            'Esqueceu sua senha?',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
      const SizedBox(height: 32),
      ButtonFull(
        onPressed: () => bloc.login(context, _emailController.text, _passwordController.text),
        title: 'Entrar',
      ),
    ];
  }
}
