import 'package:awesome_style_field/awesome_style_field.dart';
import 'package:flutter/material.dart';
import 'package:parot/presentation/design_component/parrot_color.dart';

class ParrotCommentInputField extends StatefulWidget {
  String? hintText;
  TextStyle? hintStyle;
  TextStyle? style;
  Function(String)? onChanged;
  Function(String)? onSubmitted;
  double? sendButtonRadius;
  int? maxLength;
  List<String>? commentTargetList;

  ParrotCommentInputField({
    this.hintText,
    this.hintStyle,
    this.onChanged,
    this.onSubmitted,
    this.sendButtonRadius,
    this.commentTargetList,
    this.maxLength,
  });

  @override
  State<ParrotCommentInputField> createState() => _ParrotCommentInputFieldState();
}

class _ParrotCommentInputFieldState extends State<ParrotCommentInputField> {
  bool sendButtonActive = false;
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  List<AwesomeKeyword> commentTargets = [];
  @override
  Widget build(BuildContext context) {
    commentTargets = widget.commentTargetList
            ?.map(
              (e) => AwesomeKeyword(
                text: "@$e",
                style: const TextStyle(
                  color: ParrotColor.red500,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
            .toList() ??
        [];
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: AwesomeStyleFormField(
              keywords: commentTargets,
              onChanged: (str) {
                if (str.isEmpty) {
                  setState(() {
                    sendButtonActive = false;
                  });
                } else {
                  setState(() {
                    sendButtonActive = true;
                  });
                }
                if (widget.onChanged != null) {
                  widget.onChanged!(str);
                }
              },
              maxLength: widget.maxLength ?? 140,
              onFieldSubmitted: widget.onSubmitted,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText ?? "댓글을 남겨보세요.",
                hintStyle: widget.hintStyle ??
                    const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ParrotColor.gray200,
                    ),
                counter: const SizedBox.shrink(),
              ),
              style: widget.style ??
                  const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ParrotColor.gray800,
                  ),
              maxLines: null,
            ),
          ),
          CircleAvatar(
            radius: widget.sendButtonRadius ?? 14,
            backgroundColor: sendButtonActive ? ParrotColor.red500 : ParrotColor.gray200,
            child: Image.asset("asset/icon/stroke_arrow_upward.png", height: 14, width: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
