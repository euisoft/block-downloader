import 'package:block_downloader/colors.dart';
import 'package:block_downloader/theme.dart';
import 'package:flutter/widgets.dart';

class StickyHeaderTitle extends StatelessWidget {
  final String title;

  const StickyHeaderTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(spacing(2)),
      color: componentBackground,
      child: Text(title),
    );
  }
}
