import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/design_component/parrot_color.dart';
import 'package:parot/presentation/design_component/parrot_text_style.dart';

class ParrotDepthHeader extends AppBar {
  ParrotDepthHeader({
    super.key,
    String? title,
    Widget? titleWidget,
    List<Widget>? actions,
    VoidCallback? onSearchTap,
    VoidCallback? onNotiTap,
    Widget? leading,
    bool needHeaderBottomBorder = false,
  }) : super(
          backgroundColor: Colors.white,
          leading: leading ?? IconButton(onPressed: Get.back, icon: Image.asset("asset/icon/stroke_arrow_left.png", height: 24, width: 24)),
          title: title != null ? Text(title, style: parrotDepthHeaderStyle) : titleWidget ?? const SizedBox.shrink(),
          actions: actions ??
              [
                IconButton(onPressed: onSearchTap, icon: Image.asset("asset/icon/stroke_search.png", height: 24, width: 24)),
                IconButton(onPressed: onNotiTap, icon: Image.asset("asset/icon/stroke_alart.png", height: 24, width: 24)),
              ],
          centerTitle: true,
          shape: needHeaderBottomBorder
              ? const Border(
                  bottom: BorderSide(color: ParrotColor.gray50, width: 1),
                )
              : null,
        );
}
