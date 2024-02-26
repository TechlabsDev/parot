import 'package:flutter/material.dart';
import 'package:parot/presentation/design_component/parrot_color.dart';

class ParrotElevatedButton extends ElevatedButton {
  ParrotElevatedButton({
    super.key,
    required VoidCallback onPressed,
    required String text,
    Widget? leadingIcon,
    Widget? trailingIcon,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor,
    FontWeight? textWeight,
    double? textSize,
    double? elevation,
    double? radius,
    Size? size,
    bool enabled = true,
  }) : super(
          onPressed: enabled ? onPressed : () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              enabled ? leadingIcon ?? const SizedBox.shrink() : const SizedBox.shrink(),
              if (enabled && leadingIcon != null) const SizedBox(width: 4),
              Text(
                text,
                style: TextStyle(
                  fontSize: textSize ?? 16,
                  fontWeight: textWeight ?? FontWeight.w700,
                  color: enabled
                      ? textColor ?? Colors.white
                      : (backgroundColor != null && backgroundColor == Colors.white)
                          ? ParrotColor.gray100
                          : Colors.white,
                ),
              ),
              if (enabled && trailingIcon != null) const SizedBox(width: 4),
              enabled ? trailingIcon ?? const SizedBox.shrink() : const SizedBox.shrink(),
            ],
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 12),
              side: BorderSide(color: enabled ? borderColor ?? ParrotColor.gray800 : ParrotColor.gray100),
            ),
            elevation: elevation ?? 0.0,
            fixedSize: size ?? const Size(218, 52),
            backgroundColor: enabled
                ? backgroundColor ?? ParrotColor.gray800
                : (backgroundColor != null && backgroundColor == Colors.white)
                    ? Colors.white
                    : ParrotColor.gray100,
          ),
        );
}
