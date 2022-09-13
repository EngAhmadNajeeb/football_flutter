import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:football_flutter/shared/resources/app_images.dart';

enum LoadingType { fadingCube, circularProgress, threeBounce }

enum ErrorAssetsType { card }

class LoadNetworkImage extends StatelessWidget {
  final String src;
  final bool isCustomCacheManager;
  final LoadingType loadingType;
  final ErrorAssetsType? errorAssetsType;
  final BoxFit fit;
  final double? width;
  final double? height;

  const LoadNetworkImage({
    Key? key,
    required this.src,
    this.isCustomCacheManager = true,
    this.loadingType = LoadingType.threeBounce,
    this.errorAssetsType = ErrorAssetsType.card,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      width: width,
      height: height,
      imageUrl: src,
      placeholder: (context, url) {
        switch (loadingType) {
          default:
            return Center(
              child: SpinKitThreeBounce(
                color: Colors.yellow[700],
                size: 20,
              ),
            );
        }
      },
      errorWidget: (context, url, error) {
        switch (errorAssetsType) {
          default:
            return Image.asset(
              AppImages.kFlag,
              fit: fit,
              width: width,
              height: height,
            );
        }
      },
    );
  }
}
