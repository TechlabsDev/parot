import 'package:flutter/material.dart';
import 'package:parot/presentation/design_component/parrot_check_circle.dart';

class ParrotCheckCircleInRow extends StatefulWidget {
  @override
  State<ParrotCheckCircleInRow> createState() => _ParrotCheckCircleInRowState();

  ParrotCheckCircleInRow({
    required this.value,
    required this.onChanged,
    required this.titleText,
    this.checkCircleColor,
    this.trailing,
  });
  ValueChanged<bool> onChanged;
  bool value;
  Color? checkCircleColor;
  Widget titleText;
  Widget? trailing;
}

class _ParrotCheckCircleInRowState extends State<ParrotCheckCircleInRow> {
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ParrotCheckCircle(
            value: widget.value,
            onChanged: (_) {},
            color: widget.checkCircleColor,
          ),
          const SizedBox(width: 8),
          widget.titleText,
          if (widget.trailing != null) const Spacer(),
          if (widget.trailing != null) widget.trailing!,
        ],
      ),
    );
  }
}
