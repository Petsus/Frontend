import 'dart:io';
import 'package:path/path.dart';

// Run code => dart ./utils/models_import_generator.dart

const String models = '.\\lib\\api\\model\\';

main() {
  generate(Directory(models));
}

void generate(Directory currentDir) async {
  final outputFile = File(join(currentDir.path, '${basename(currentDir.path)}.dart'));

  if (await outputFile.exists()) {
    await outputFile.delete();
  }

  String output = _getFiles(currentDir);
  outputFile.writeAsStringSync(output);
}

String _getFiles(Directory currentDir) {
  String output = '';

  for (final file in currentDir.listSync()) {
    if (file is Directory) {
      output += _getFiles(file);
    } else if (file is File && basename(file.parent.path) != 'data_response.dart') {
      output += "export '${basename(file.parent.path)}/${basename(file.path)}';\n";
    }
  }

  return output;
}
