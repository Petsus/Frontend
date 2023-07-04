
import 'package:flutter/material.dart';
import 'package:petsus/api/model/veterinary/veterinary.dart';

abstract class IVeterinaryRouter {
  Future details({required BuildContext context, required Veterinary veterinary});
}