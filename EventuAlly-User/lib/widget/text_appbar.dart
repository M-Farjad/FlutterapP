import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TextAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        CupertinoIcons.back,
        size: 24,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
