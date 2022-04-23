import 'package:block_downloader/colors.dart';
import 'package:block_downloader/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackgroundPercent extends StatelessWidget {
  final double percent;

  const BackgroundPercent({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: spacing(9),
      width: Get.width * percent,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: createBorderRadius(),
      ),
    );
  }
}
