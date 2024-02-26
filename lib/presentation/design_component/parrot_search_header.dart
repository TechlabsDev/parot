import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/design_component/parrot_color.dart';

class ParrotSearchHeader extends AppBar {
  ParrotSearchHeader({
    super.key,
    Widget? leading,
    String? hintText,
    TextStyle? hintStyle,
    int? maxLength,
    Function(String str)? onSubmit,
  }) : super(
          leading: leading ?? IconButton(onPressed: Get.back, icon: Image.asset("asset/icon/stroke_arrow_left.png", height: 24, width: 24)),
          title: CupertinoSearchTextField(
            prefixIcon: const SizedBox.shrink(),
            backgroundColor: Colors.transparent,
            placeholder: hintText ?? "URL 또는 검색어를 입력해주세요",
            placeholderStyle: hintStyle ??
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ParrotColor.gray200,
                ),
          ),
          centerTitle: true,
        );
}
