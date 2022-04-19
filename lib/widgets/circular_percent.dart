import 'package:block_downloader/colors.dart';
import 'package:block_downloader/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularPercent extends StatelessWidget {
  final double percent;

  const CircularPercent({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing()),
      child: CircularPercentIndicator(
        lineWidth: spacing(0.5),
        radius: spacing(3),
        percent: percent,
        progressColor: primary,
      ),
    );
  }
}
