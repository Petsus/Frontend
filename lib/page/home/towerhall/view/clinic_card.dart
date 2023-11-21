import 'package:flutter/material.dart';
import 'package:petsus/api/model/clinic/clinics.dart';
import 'package:petsus/util/components/helper_image.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class ClinicCard extends StatelessWidget {
  final Clinics clinic;
  final VoidCallback callback;

  const ClinicCard({
    super.key,
    required this.clinic,
    required this.callback,
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
                  clinic.image,
                  fit: BoxFit.cover,
                  loadingBuilder: loading(),
                  errorBuilder: error(),
                ),
              ),
            ),
            SizedBox(width: DimenApp.paddingDefault.size),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clinic.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  clinic.address.formattedAddress,
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
