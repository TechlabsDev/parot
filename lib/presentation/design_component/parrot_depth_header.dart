import 'package:flutter/material.dart';

class ParrotDepthHeader extends AppBar {
  ParrotDepthHeader({
    super.key,
    required Widget title,
    List<Widget>? actions,
    VoidCallback? onSearchTap,
    VoidCallback? onNotiTap,
    Widget? leading,
  }) : super(
          leading: leading ?? IconButton(onPressed: () {}, icon: Image.asset("asset/icon/stroke_arrow_left.png", height: 24, width: 24)),
          title: title,
          actions: actions ??
              [
                IconButton(onPressed: onSearchTap, icon: Image.asset("asset/icon/stroke_search.png", height: 24, width: 24)),
                IconButton(onPressed: onNotiTap, icon: Image.asset("asset/icon/stroke_alart.png", height: 24, width: 24)),
              ],
          centerTitle: true,
        );
}
