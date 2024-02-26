import 'package:flutter/material.dart';
import 'package:parot/presentation/design_component/parrot_color.dart';

class ParrotCheckCircle extends StatefulWidget {
  @override
  State<ParrotCheckCircle> createState() => _ParrotCheckCircleState();

  ParrotCheckCircle({
    required this.value,
    required this.onChanged,
    this.color,
  });
  ValueChanged<bool> onChanged;
  bool value;
  Color? color;
}

class _ParrotCheckCircleState extends State<ParrotCheckCircle> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.value = !widget.value;
        });
        widget.onChanged(widget.value);
      },
      child: CircleAvatar(
        backgroundColor: widget.value ? widget.color ?? ParrotColor.red500 : ParrotColor.gray50,
        radius: 12,
        child: Center(
          child: Image.asset(
            "asset/icon/stroke_check.png",
            height: 12,
            width: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
