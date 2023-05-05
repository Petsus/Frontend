import 'package:flutter/material.dart';
import 'package:petsus/api/model/address/cities.dart';
import 'package:petsus/api/model/address/state.dart';
import 'package:petsus/component/button/button_full.dart';
import 'package:petsus/component/card/card_app.dart';
import 'package:petsus/component/textfield/dropdown_app.dart';
import 'package:petsus/component/textfield/textfield_app.dart';
import 'package:petsus/page/home/adm/fragment/city/item_city.dart';
import 'package:petsus/util/resources/app_color.dart';

class CityPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController searchController = TextEditingController();

  CityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_city,
                  color: ColorApp.onBackground.color,
                  size: 32,
                ),
                const SizedBox(width: 8),
                Text(
                  'Cidades',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            CardApp(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Flexible(
                        child: DropdownApp(
                          margin: EdgeInsets.symmetric(vertical: 16),
                          items: ['SP', 'RJ'],
                          hintText: 'UF',
                        ),
                      ),
                      SizedBox(width: 16),
                      Flexible(
                        child: DropdownApp(
                          margin: EdgeInsets.symmetric(vertical: 16),
                          items: ['Sorocaba', 'Rio de janeiro'],
                          hintText: 'Cidade',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: TextFieldApp(
                          controller: nameController,
                          hintText: 'Name',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: TextFieldApp(
                          controller: emailController,
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: TextFieldApp(
                          controller: passwordController,
                          hintText: 'Senha',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ButtonFull(
                      title: 'Adicionar',
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
            CardApp(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  TextFieldApp(controller: searchController, hintText: 'Pesquisar',),
                  const SizedBox(height: 16),
                  ListView.separated(
                    itemCount: 10 + 2,
                    shrinkWrap: true,
                    separatorBuilder: (_ , __) => Divider(height: 1, color: ColorApp.onBackground.color.withAlpha(127)),
                    itemBuilder: (context, index) {
                      if (index == 0) return const CityHeader();
                      return CityItem(city: Cities(id: 0, name: 'Sorocaba', state: States(id: 0, name: 'São Paulo', initials: 'SP')));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
