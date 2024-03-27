import 'package:flutter/material.dart';
import 'package:parot/presentation/design_component/parrot_text_style.dart';

class ParrotHeader extends AppBar {
  ParrotHeader({super.key, Widget? titleWidget, String? title, List<Widget>? actions, VoidCallback? onSearchTap, VoidCallback? onNotiTap})
      : super(
          title: title != null ? Text(title, style: parrotHeaderStyle) : titleWidget ?? const SizedBox.shrink(),
          actions: actions ??
              [
                IconButton(onPressed: onSearchTap, icon: Image.asset("asset/icon/stroke_search.png", height: 24, width: 24)),
                IconButton(onPressed: onNotiTap, icon: Image.asset("asset/icon/stroke_alart.png", height: 24, width: 24)),
              ],
        );
}
