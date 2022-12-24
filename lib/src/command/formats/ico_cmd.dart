import 'dart:typed_data';

import '../../formats/formats.dart';
import '../command.dart';
import '_file_access.dart'
if (dart.library.io) '_file_access_io.dart'
if (dart.library.js) '_file_access_html.dart';

// Decode a ICO Image from byte [data].
class DecodeIcoCmd extends Command {
  Uint8List data;

  DecodeIcoCmd(this.data);

  @override
  void executeCommand() {
    outputImage = decodeIco(data);
  }
}

// Decode a ICO from a file at the given [path].
class DecodeIcoFileCmd extends Command {
  String path;

  DecodeIcoFileCmd(this.path);

  @override
  void executeCommand() {
    final bytes = readFile(path);
    outputImage = bytes != null ? decodeIco(bytes) : null;
  }
}

// Encode an Image to the ICO format.
class EncodeIcoCmd extends Command {
  EncodeIcoCmd(Command? input)
      : super(input);

  @override
  void executeCommand() {
    input?.execute();
    outputImage = input?.outputImage;
    if (outputImage != null) {
      outputBytes = encodeIco(outputImage!);
    }
  }
}

// Encode an Image to the ICO format and write it to a file at the given
// [path].
class EncodeIcoFileCmd extends EncodeIcoCmd {
  String path;

  EncodeIcoFileCmd(Command? input, this.path)
      : super(input);

  @override
  void executeCommand() {
    super.executeCommand();
    if (outputBytes != null) {
      writeFile(path, outputBytes!);
    }
  }
}
