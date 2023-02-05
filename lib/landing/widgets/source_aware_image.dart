import 'package:flutter/material.dart';

// Widget displays Image.network or Image.asset on the basis of source.
class SourceAwareImage extends StatelessWidget {
  final String image;
  final bool isNetworkImage;
  final BoxFit? fit;

  const SourceAwareImage({
    required this.image,
    required this.isNetworkImage,
    this.fit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isNetworkImage
        ? Image.network(
            image,
            fit: fit,
          )
        : Image.asset(
            image,
            fit: fit,
          );
  }
}
