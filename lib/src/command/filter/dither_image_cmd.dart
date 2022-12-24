import '../../filter/dither_image.dart' as g;
import '../../util/quantizer.dart';
import '../command.dart';

class DitherImageCmd extends Command {
  Quantizer? quantizer;
  g.DitherKernel kernel;
  bool serpentine;

  DitherImageCmd(Command? input, { this.quantizer,
      this.kernel = g.DitherKernel.floydSteinberg, this.serpentine = false })
      : super(input);

  @override
  void executeCommand() {
    input?.execute();
    final img = input?.outputImage;
    outputImage = img != null ? g.ditherImage(img, quantizer: quantizer,
        kernel: kernel, serpentine: serpentine) : null;
  }
}
