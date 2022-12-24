import '../../transform/copy_resize_crop_square.dart';
import '../command.dart';

class CopyResizeCropSquareCmd extends Command {
  int size;

  CopyResizeCropSquareCmd(Command? input, this.size)
      : super(input);

  @override
  void executeCommand() {
    input?.execute();
    final img = input?.outputImage;
    outputImage = img != null ? copyResizeCropSquare(img, size) : null;
  }
}
