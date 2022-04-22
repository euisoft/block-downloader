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
    return InkResponse(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: child,
    );
  }
}
