import 'package:flutter/material.dart';
/// A widget that displays a logo image with specified dimensions.
///
/// The [LogoWidget] takes an image path, width, and height as required parameters
/// and displays the image inside a container with padding.
///
/// Example usage:
/// ```dart
/// LogoWidget(
///   imagePath: 'assets/logo.png',
///   width: 100.0,
///   height: 100.0,
/// )
/// ```
///
/// The [imagePath] parameter specifies the path to the image asset.
/// The [width] and [height] parameters specify the dimensions of the image.

class LogoWidget extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const LogoWidget({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            imagePath,
            width: width,
            height: height,
          ),
        ),
      ],
    );
  }
}
