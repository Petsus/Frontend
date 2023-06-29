import 'package:flutter/material.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class HeaderSearch extends StatelessWidget {
  final TextEditingController searchController;
  final Future<String> username;

  const HeaderSearch({
    super.key,
    required this.searchController,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(labelText: 'Pesquisar', hintText: 'Pesquisar'),
          ),
        ),
        Flexible(
          flex: 4,
          child: Center(
            child: FutureBuilder(
              future: username,
              builder: (_, snapshot) => Padding(
                padding: EdgeInsets.symmetric(horizontal: DimenApp.marginSmall.size),
                child: Text(
                  'Olá ${snapshot.data ?? ''}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
