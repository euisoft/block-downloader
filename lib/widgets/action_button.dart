import 'package:block_downloader/theme.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Function()? onDoubleTap;

  const ActionButton({
    Key? key,
    required this.child,
    this.onTap,
    this.onDoubleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        borderRadius: BorderRadius.circular(spacing(2.5)),
        child: Ink(
          width: spacing(5),
          height: spacing(5),
          child: child,
        ),
      ),
    );
  }
}
