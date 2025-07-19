import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/constant/app_color.dart';
import 'package:shimmer/shimmer.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: imageUrl,
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: AppColor.greyShade300,
          highlightColor: AppColor.white,
          child: Container(
            color: AppColor.white,
          ),
        );
      },
    );
  }
}
