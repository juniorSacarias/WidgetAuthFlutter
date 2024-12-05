import 'package:flutter/material.dart';

/// A widget that displays a logo image with specified dimensions.
///
/// The [LogoWidget] takes an image path, width, and height as required parameters
/// and displays the image inside a container with padding.
///
/// Example usage:
/// ```dart
/// LogoWidget(
///   imagePath: 'https://example.com/logo.png',
///   width: 100.0,
///   height: 100.0,
/// )
/// ```
///
/// The [imagePath] parameter specifies the URL to the image.
/// The [width] and [height] parameters specify the dimensions of the image.

class LogoWidget extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final double borderRadius;

  const LogoWidget({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.network(
              imagePath,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
