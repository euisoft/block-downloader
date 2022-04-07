import 'package:block_downloader/styles/colors.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: grey,
      padding: const EdgeInsets.all(16),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: true,
          hintText: 'Youtube Link',
          prefixIcon: const Icon(Icons.add),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
