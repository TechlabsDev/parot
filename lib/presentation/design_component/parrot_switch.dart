import 'package:flutter/cupertino.dart';
import 'package:parot/presentation/design_component/parrot_color.dart';

class ParrotSwitch extends CupertinoSwitch {
  const ParrotSwitch({
    super.key,
    required bool value,
    required ValueChanged<bool> onChanged,
    Color? activeColor,
  }) : super(
          value: value,
          onChanged: onChanged,
          activeColor: activeColor ?? ParrotColor.red500,
        );
}
