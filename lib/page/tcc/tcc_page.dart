import 'dart:html';

import 'package:flutter/material.dart';
import 'package:petsus/component/button/button_full.dart';
import 'package:petsus/component/card/card_app.dart';
import 'package:petsus/util/resources/app_color.dart';

const String urlBackend = 'https://github.com/gluan2018/TCC-Backend';
const String urlFrontend = 'https://github.com/gluan2018/TCC-Frontend';
const String urlAndroid = 'https://github.com/gluan2018/TCC-Android';

const String urlPostman = 'https://www.postman.com/petsus/workspace/team-workspace/overview';
const String urlSwagger = 'https://backendpetsus.azurewebsites.net/swagger-ui/index.html';
const String urlFlutter = 'https://petsus.app.br';

class TccPage extends StatelessWidget {
  const TccPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                _createOption(context, 'Github: Backend', 'Spring boot', urlBackend, '1'),
                _createOption(context, 'Github: Frontend', 'Site Flutter', urlFrontend, '1'),
                _createOption(context, 'Github: Android', 'Aplicativo nativo Android com Kotlin', urlAndroid, '1'),
              ],
            ),
            Row(
              children: [
                _createOption(context, 'Postman', 'Consulte e teste as rotas da aplicação', urlPostman, '2'),
                _createOption(context, 'Swagger', 'Consulte e teste as rotas da aplicação', urlSwagger, '2'),
              ],
            ),
            Row(
              children: [
                _createOption(context, 'Site', 'Visite o site', urlFlutter, '3'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _createOption(BuildContext context, String title, String subtitle, String url, String tag) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.white,
            width: 1.0
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        color: ColorApp.primaryContainer.color,
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
              const SizedBox(height: 64),
              Text(
                'Ir para a página',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
