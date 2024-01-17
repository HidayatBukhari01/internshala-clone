import 'package:flutter/material.dart';
import 'package:internshala_clone/res/colors.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    required this.height,
    required this.width,
    this.radius = 16,
  });
  final double height;
  final double width;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.blueGrey[50]!,
      highlightColor: Colors.blueGrey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
