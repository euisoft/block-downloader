import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:flutter/widgets.dart';
import 'package:block_downloader/widgets/table_cell_padded.dart';

class StickyHeaderContent extends StatelessWidget {
  final List<StreamInfo> qualities;

  const StickyHeaderContent({
    Key? key,
    required this.qualities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: qualities
          .map(
            (quality) => TableRow(
              children: [
                TableCellPadded(child: Text(quality.qualityLabel)),
                TableCellPadded(child: Text(quality.bitrate.toString())),
                TableCellPadded(child: Text(quality.size.toString())),
              ],
            ),
          )
          .toList(),
    );
  }
}
