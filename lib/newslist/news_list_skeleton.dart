import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_colors.dart';

class NewsListSkeleton extends StatelessWidget {
  const NewsListSkeleton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.skeleton,
      highlightColor: AppColors.themeColorSecond,
      period: const Duration(seconds: 2),
      child: ListView.builder(
          itemCount: 12,
          padding: const EdgeInsets.all(0.0),
          reverse: false,
          itemBuilder: (_, int index) {
            return GridTile(
              child: Container(
                margin: const EdgeInsets.all(5),
                height: 130,
                decoration: ShapeDecoration(
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0))),
                width: double.maxFinite,
              ),
            );
          }),
    );
  }
}
