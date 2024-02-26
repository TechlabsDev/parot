import 'package:flutter/material.dart';
import 'package:parot/extension/datetime_extension.dart';
import 'package:parot/extension/int_extension.dart';
import 'package:parot/presentation/design_component/parrot_color.dart';

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
  });

  final Function? onRecommentTap;
  final String userImageUrl;
  final String userNickname;
  final String content;
  final DateTime dateTime;
  final int likeCount;
  final int commentCount;
}

class _ParrotCommentCellState extends State<ParrotCommentCell> {
  @override
  Widget build(BuildContext context) {
    // return Container();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                        widget.dateTime.commentCellDate,
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
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  widget.content,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ParrotColor.gray600,
                  ),
                ),
              ),
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
