import 'package:flutter/material.dart';
import 'package:petsus/api/model/address/cities.dart';

class CityHeader extends StatelessWidget {
  const CityHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: const [
            Expanded(
              child: Text('#'),
              flex: 1,
            ),
            Expanded(
              child: Text('Nome'),
              flex: 8,
            ),
            Expanded(
              child: Text('Estado'),
              flex: 4,
            ),
            Expanded(
              child: Text('Ativo'),
              flex: 4,
            ),
            Expanded(
              child: Text('Ação'),
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class CityItem extends StatelessWidget {
  final Cities city;

  const CityItem({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text('${city.id}'),
            ),
            Expanded(
              flex: 8,
              child: Text(city.name),
            ),
            // Expanded(
            //   flex: 4,
            //   child: Text(city.state.initials),
            // ),
            Expanded(
              flex: 4,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Switch(
                    value: false,
                    onChanged: (value) {},
                  )),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  MaterialButton(onPressed: () {}),
                  MaterialButton(onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
