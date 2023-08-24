import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageWidget extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;

  const ImageWidget({super.key,
    required this.url,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (url == null) return buildPlaceHolderWidget();

    if (url!.startsWith("http")) {
      return buildNetworkImage();
    } else if (url!.startsWith("assets")) {
      return buildImageAsset();
    }

    return buildImageFile();
  }


  Widget buildNetworkImage() {
    return CachedNetworkImage(
      imageUrl: url!,
      width: width,
      height: height,
      fit: fit,
      useOldImageOnUrlChange: true,
      placeholder: (context, url) => buildPlaceHolderWidget(),
      errorWidget: (context, url, error) {
        debugPrint('CachedNetworkImage: $error');
        return buildErrorWidget();
      },
    );
  }

  buildErrorWidget() {
    return Container(
      width: width,
      height: height,
      color: Colors.redAccent,
    );
  }

  buildPlaceHolderWidget() {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: .5,
            sigmaY: .5,
          ),
          child: Container(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildImageAsset() {
    return Image.asset(
      url!,
      fit: fit,
      height: height,
      width: width,
    );
  }

  Widget buildImageFile() {
    return Image.file(
      File(url!),
      fit: fit,
      height: height,
      width: width,
    );
  }
}
