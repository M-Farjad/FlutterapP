import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TextAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(CupertinoIcons.back),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        'Your Orders',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
