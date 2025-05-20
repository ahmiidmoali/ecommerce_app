import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;

  CustomNetworkImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl, alignment: Alignment.center,
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator()), // Placeholder while loading
      errorWidget: (context, url, error) =>
          const Icon(Icons.error), // Error widget if loading fails
      fit: BoxFit.fill, // Adjust image fit as needed
    );
  }
}
