import 'package:flutter/material.dart';
import 'package:petsus/component/header/header_search.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class UserFragmentPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  // final

  UserFragmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DimenApp.marginDefault.all,
      child: Column(
        children: [
          // HeaderSearch(searchController: searchController, username: )
        ],
      ),
    );
  }
}
