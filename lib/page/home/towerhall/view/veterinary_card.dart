import 'package:flutter/material.dart';
import 'package:petsus/api/model/veterinary/veterinary.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class VeterinaryCard extends StatelessWidget {
  final Veterinary veterinary;
  final VoidCallback callback;

  const VeterinaryCard({
    super.key,
    required this.callback,
    required this.veterinary,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: DimenApp.paddingDefault.size),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  veterinary.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: DimenApp.paddingDefault.size),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  veterinary.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  veterinary.crm,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
