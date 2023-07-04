import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petsus/api/model/clinic/clinics.dart';
import 'package:petsus/component/card/card_info.dart';
import 'package:petsus/util/resources/app_color.dart';
import 'package:petsus/util/resources/dimen_app.dart';

class ClinicDetailsPage extends StatelessWidget {
  final Clinics clinic;

  const ClinicDetailsPage({
    Key? key,
    required this.clinic,
  }) : super(key: key);

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
                    clinic.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: DimenApp.marginDefault.size),
            Column(
              children: [
                Text(
                  clinic.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: DimenApp.marginDefault.size),
                if (clinic.cpf != null) InfoCard(title: 'CPF:', subtitle: clinic.cpf!),
                if (clinic.cnpj != null) InfoCard(title: 'CNPJ:', subtitle: clinic.cnpj!),
                if (clinic.site != null) InfoCard(title: 'Site:', subtitle: clinic.site!, isHyperLink: true),
                if (clinic.phone != null) InfoCard(title: 'Celular:', subtitle: clinic.phone!),
                InfoCard(title: 'Endereço:', subtitle: clinic.address.formattedAddress),
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: DimenApp.borderRadius.radius,
                    child: GoogleMap(
                      compassEnabled: false,
                      mapToolbarEnabled: false,
                      rotateGesturesEnabled: false,
                      scrollGesturesEnabled: false,
                      myLocationEnabled: false,
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      zoomGesturesEnabled: false,
                      markers: {
                        Marker(
                          markerId: MarkerId(clinic.name),
                          position: LatLng(clinic.address.lat, clinic.address.lng),
                          infoWindow: InfoWindow(
                            title: clinic.name,
                            snippet: clinic.address.formattedAddress,
                          ),
                        ),
                      },
                      initialCameraPosition: CameraPosition(
                        target: LatLng(clinic.address.lat, clinic.address.lng),
                        zoom: 16.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
