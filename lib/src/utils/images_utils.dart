import 'package:flicks_time/src/config/config.dart';

class ImageUtils {
  static final String _imageBase = Environment.imageBaseUri;

  static String getImagePath(String path, {String ext = 'w500'}) {
    final String imagePath = Uri.parse('$_imageBase$ext$path').toString();
    return imagePath;
  }
}
