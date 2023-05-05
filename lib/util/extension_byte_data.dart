
import 'dart:convert';
import 'dart:typed_data';

extension ByteDataExtension on ByteData {
  String get string {
    var items = buffer.asUint8List(offsetInBytes, lengthInBytes);
    return utf8.decode(items);
  }
}