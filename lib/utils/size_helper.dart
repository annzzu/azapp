///Helper class for additional methods
///Viewport [Width] == 375 && [Height] == 812
class SizeHelper {
  ///Method to calculate margins/paddings/sizes [dynamically] for flexibility
  static calculateSize(double minSize, double maxSize, double size) {
    if (size < minSize) {
      size = minSize;
    } else if (size > maxSize) {
      size = maxSize;
    }
    return size;
  }
}