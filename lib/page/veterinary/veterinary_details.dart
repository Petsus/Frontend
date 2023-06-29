import 'package:flutter/material.dart';
import 'package:petsus/api/model/veterinary/veterinary.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class VeterinaryDetails extends StatelessWidget {
  final Veterinary veterinary;

  const VeterinaryDetails({
    super.key,
    required this.veterinary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DimenApp.marginDefault.all,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 256,
                height: 256,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(128),
                  child: Image.network(
                    veterinary.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: DimenApp.marginDefault.size),
            Column(
              children: [
                Text(
                  veterinary.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: DimenApp.marginDefault.size),
                _card(title: 'CRM:', subtitle: veterinary.crm, context: context),
                _card(title: 'Especialidades:', subtitle: veterinary.specialities.join('\n'), context: context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _card({
    required String title,
    required String subtitle,
    required BuildContext context,
  }) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: DimenApp.marginSmall.size),
          Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
          SizedBox(height: DimenApp.marginDefault.size),
        ],
      ),
    );
  }
}
