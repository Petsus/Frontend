
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/api/model/clinic/clinics.dart';
import 'package:petsus/component/sheet/side_sheet.dart';
import 'package:petsus/page/clinic/clinic_details_page.dart';
import 'package:petsus/page/home/towerhall/router/clinic_page_router.dart';

@Environment(Environment.dev)
@Injectable(as: IClinicRouter)
class ClinicRouter extends IClinicRouter {
  @override
  Future details({required BuildContext context, required Clinics clinic}) async {
    SideSheet.open(
      body: ClinicDetailsPage(clinic: clinic),
      side: Side.right,
      context: context,
      proportional: 2.5,
    );
  }
}