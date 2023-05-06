import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:petsus/util/extension_byte_data.dart';

Future<Map<String, dynamic>> localJson(String name, {String? namespace}) async {
  final values = await rootBundle.load('assets/$name');
  final object = jsonDecode(values.string) as Map<String, dynamic>;

  if (namespace == null) return object;
  return object[namespace] as Map<String, dynamic>;
}