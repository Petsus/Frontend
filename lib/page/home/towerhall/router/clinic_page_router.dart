import 'package:flutter/material.dart';
import 'package:petsus/api/model/clinic/clinics.dart';

abstract class IClinicRouter {
  Future details({required BuildContext context, required Clinics clinic});
}