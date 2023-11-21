import 'package:flutter/material.dart';
import 'package:petsus/api/model/veterinary/veterinary.dart';
import 'package:petsus/component/card/card_info.dart';
import 'package:petsus/util/components/helper_image.dart';
import 'package:petsus/util/resources/app_color.dart';
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
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close,
                  color: ColorApp.onBackground.color,
                ),
              ),
            ),
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
                    loadingBuilder: loading(),
                    errorBuilder: error(),
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
                InfoCard(title: 'CRM:', subtitle: veterinary.crm),
                InfoCard(title: 'Especialidades:', subtitle: veterinary.specialities.join('\n')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
