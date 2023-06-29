import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'images/icon.png',
          width: 75,
          height: 75,
        ),
        const SizedBox(width: 16),
        Text(
          'Petsus',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
