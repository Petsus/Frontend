// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:petsus/util/resources/app_color.dart';

const String urlBackend = 'https://github.com/Petsus/Backend';
const String urlFrontend = 'https://github.com/Petsus/Frontend';
const String urlAndroid = 'https://github.com/Petsus/Android';
const String urlSQL = 'https://github.com/Petsus/SQL';

const String urlPostman = 'https://www.postman.com/petsus/workspace/team-workspace/overview';
const String urlSwagger = 'https://api.petsus.app.br/swagger-ui/index.html';
const String urlFlutter = 'https://petsus.app.br';

class TccPage extends StatelessWidget {
  const TccPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          heightFactor: 0.8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _createOption(context, 'Github: SQL', 'Comandos SQL', urlBackend, '0'),
                _createOption(context, 'Github: Backend', 'Spring boot', urlBackend, '1'),
                _createOption(context, 'Github: Frontend', 'Site Flutter', urlFrontend, '2'),
                _createOption(context, 'Github: Android', 'Aplicativo nativo Android com Kotlin', urlAndroid, '3'),
                _createOption(context, 'Postman', 'Consulte e teste as rotas da aplicação', urlPostman, '4'),
                _createOption(context, 'Swagger', 'Consulte e teste as rotas da aplicação', urlSwagger, '5'),
                _createOption(context, 'Site', 'Visite o site', urlFlutter, '6')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createOption(BuildContext context, String title, String subtitle, String url, String tag) {
    return GestureDetector(
      onTap: () => window.open(url, 'new tab'),
      child: Container(
        decoration: BoxDecoration(
          color:  ColorApp.primaryContainer.color,
          border: Border.all(
              color: Colors.white,
              width: 1.0,
          ) ,
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 32),
                child: Center(
                  child: Text(tag),
                ),
                height: 32,
                width: 32,
                decoration: BoxDecoration(color: ColorApp.background.color, borderRadius: BorderRadius.circular(16)),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
