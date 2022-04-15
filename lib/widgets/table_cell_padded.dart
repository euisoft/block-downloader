import 'package:block_downloader/theme.dart';
import 'package:flutter/material.dart';

class TableCellPadded extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final TableCellVerticalAlignment? verticalAlignment;

  const TableCellPadded({
    Key? key,
    this.padding,
    this.verticalAlignment,
    required this.child,
  }) : super(key: key);

  @override
  TableCell build(BuildContext context) => TableCell(
        verticalAlignment: verticalAlignment,
        child: Padding(
          padding: padding ?? EdgeInsets.all(spacing(2)),
          child: child,
        ),
      );
}
