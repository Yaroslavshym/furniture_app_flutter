import '../classes/Furniture.dart';

class MenuAnimatedPositioned {
  int mode;
  Furniture? product;
  double percentageOfHeight;
  num positionFromTopAsPercentageOfHeight;
  num? additionalPercentageOfHeight;
  Duration duration;
  // num finalPositionFromTopAsPercentageOfHeight;
  MenuAnimatedPositioned({
    required this.mode,
    this.product,
    required this.percentageOfHeight,
    required this.positionFromTopAsPercentageOfHeight,
    this.additionalPercentageOfHeight,
    required this.duration,
    // required this.finalPositionFromTopAsPercentageOfHeight,
  }) {
    if (mode != 1 && product is! Furniture) {
      mode = 1;
    }
  }
}
