import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BaseCacheImage extends StatelessWidget {
  const BaseCacheImage({
    Key? key,
    this.width = 0,
    this.height = 0,
    this.borderRadius = 0,
    required this.size,
    required this.url,
    this.errorWidget,
  }) : super(key: key);
  final double size;
  final double width;
  final double height;
  final double borderRadius;
  final String url;
  final Widget? errorWidget;

  Widget _imageWidget(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _errorWidget() {
    return errorWidget ?? _imageWidget(const AssetImage('assets/images/noimage.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? "",
      width: width == 0 ? size : width,
      height: height == 0 ? size : height,
      imageBuilder: (context, imageProvider) {
        return _imageWidget(imageProvider);
      },
      placeholder: (context, url) {
        return const Center(child: CircularProgressIndicator());
      },
      errorWidget: (context, url, error) {
        return _errorWidget();
      },
    );
  }
}
