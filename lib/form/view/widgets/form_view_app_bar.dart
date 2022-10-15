import 'package:flutter/material.dart';

class FormViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FormViewAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 110,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 40,
          bottom: 25,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 36,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}
