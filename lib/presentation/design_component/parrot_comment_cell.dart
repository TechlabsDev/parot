import 'package:flutter/material.dart';
import 'package:parot/extension/datetime_extension.dart';
import 'package:parot/extension/int_extension.dart';
import 'package:parot/presentation/design_component/parrot_color.dart';
import 'package:styled_text/styled_text.dart';

class ParrotCommentCell extends StatefulWidget {
  @override
  State<ParrotCommentCell> createState() => _ParrotCommentCellState();

  const ParrotCommentCell({
    required this.userImageUrl,
    required this.userNickname,
    required this.content,
    required this.dateTime,
    required this.likeCount,
    required this.commentCount,
    this.onRecommentTap,
    this.isRecomment = false,
    this.recommentTargetNicknameList,
  });

  final Function? onRecommentTap;
  final String userImageUrl;
  final String userNickname;
  final String content;
  final DateTime dateTime;
  final int likeCount;
  final int commentCount;
  final bool isRecomment;
  final List<String>? recommentTargetNicknameList;
}

class _ParrotCommentCellState extends State<ParrotCommentCell> {
  @override
  Widget build(BuildContext context) {
    List<String> recommnetTargetNickWithAtMark = [];
    if (widget.recommentTargetNicknameList != null) {
      recommnetTargetNickWithAtMark = widget.recommentTargetNicknameList!.map((e) => "@$e").toList();
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isRecomment) const SizedBox(width: 36),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(widget.userImageUrl),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userNickname,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: ParrotColor.gray600,
                        ),
                      ),
                      Text(
                        widget.dateTime.YYYYMMDDhhmmWithColon,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: ParrotColor.gray500,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "asset/icon/stroke_alart.png",
                      height: 16,
                      width: 16,
                      color: ParrotColor.gray400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Builder(builder: (context) {
                String comment = "";

                ///대댓글에 닉네임이 있다면 볼드+빨강 표기
                if (recommnetTargetNickWithAtMark.isNotEmpty) {
                  for (String element in recommnetTargetNickWithAtMark) {
                    comment = widget.content.replaceAll(element, "<nick>$element</nick>");
                  }
                } else {
                  comment = widget.content;
                }
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: StyledText(
                    text: comment,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ParrotColor.gray600,
                    ),
                    tags: {
                      'nick': StyledTextTag(
                        style: const TextStyle(
                          color: ParrotColor.red500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    },
                  ),
                );
              }),
              const SizedBox(height: 8),
              Row(
                children: [
                  Image.asset("asset/icon/stroke_thumbup.png", width: 16, height: 16, color: ParrotColor.gray400),
                  const SizedBox(width: 4),
                  Text(
                    widget.likeCount.toCommaFormat,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: ParrotColor.gray400,
                    ),
                  ),
                  if (!widget.isRecomment) ...[
                    const SizedBox(width: 16),
                    Image.asset("asset/icon/stroke_community.png", width: 16, height: 16, color: ParrotColor.gray400),
                    const SizedBox(width: 4),
                    Text(
                      widget.commentCount.toCommaFormat,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: ParrotColor.gray400,
                      ),
                    ),
                  ],
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () => widget.onRecommentTap,
                    child: const Text(
                      "답글쓰기",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: ParrotColor.gray400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
