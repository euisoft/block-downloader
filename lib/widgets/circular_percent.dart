import 'package:block_downloader/colors.dart';
import 'package:block_downloader/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularPercent extends StatelessWidget {
  final double percent;
  final bool isPaused;

  const CircularPercent({
    Key? key,
    required this.percent,
    required this.isPaused,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      lineWidth: spacing(0.5),
      radius: spacing(3),
      percent: percent,
      backgroundColor: Colors.white,
      progressColor: isPaused ? Colors.redAccent : primary,
    );
  }
}
