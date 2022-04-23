import 'package:block_downloader/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DownloadTooltip extends StatelessWidget {
  const DownloadTooltip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing()),
      child: Text.rich(
        const TextSpan(
          text: 'Click: Pause / Resume\n\n',
          children: [
            TextSpan(text: 'Double Click: Cancel'),
          ],
        ),
        style: Get.textTheme.bodySmall,
      ),
    );
  }
}
