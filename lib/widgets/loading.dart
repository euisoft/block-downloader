import 'package:block_downloader/colors.dart';
import 'package:block_downloader/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: spacing(),
        horizontal: spacing(2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(spacing(0.5)),
        child: Shimmer(
          child: Container(
            height: spacing(9),
            color: background,
          ),
        ),
      ),
    );
  }
}
