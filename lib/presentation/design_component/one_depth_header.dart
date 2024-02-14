import 'package:flutter/material.dart';

class OneDepthHeader extends AppBar {
  OneDepthHeader({super.key, required Widget title, List<Widget>? actions, VoidCallback? onSearchTap, VoidCallback? onNotiTap})
      : super(
          title: title,
          actions: [
            IconButton(onPressed: onSearchTap, icon: Image.asset("asset/icon/stroke_search.png", height: 24, width: 24)),
            IconButton(onPressed: onNotiTap, icon: Image.asset("asset/icon/stroke_alart.png", height: 24, width: 24)),
          ],
        );
}
