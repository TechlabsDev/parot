import 'package:flutter/material.dart';
import 'package:parot/extension/datetime_extension.dart';
import 'package:parot/extension/int_extension.dart';
import 'package:parot/presentation/design_component/parrot_color.dart';
import 'package:styled_text/tags/styled_text_tag.dart';
import 'package:styled_text/widgets/styled_text.dart';

//가격이 음수로 들어오면 '아직 가격정보가 쌓이지 않은' 것
class ParrotAlarmCell extends StatefulWidget {
  final String productImage;
  final String title;
  final String content;
  final int currentPrice;
  final int averagePrice;
  final DateTime dateTime;

  ParrotAlarmCell({
    required this.productImage,
    required this.title,
    required this.content,
    required this.currentPrice,
    required this.averagePrice,
    required this.dateTime,
  });

  @override
  State<ParrotAlarmCell> createState() => _ParrotAlarmCellState();
}

class _ParrotAlarmCellState extends State<ParrotAlarmCell> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 64,
          width: 64,
          child: Card(
            elevation: 0,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: ParrotColor.gray50),
            ),
            child: Image.network(widget.productImage),
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              widget.currentPrice > 0
                  ? StyledText(text: "<pt>현재가</pt> <b>${widget.currentPrice.toCommaFormat}원</b>", tags: {
                      "pt": StyledTextTag(
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: ParrotColor.gray600),
                      ),
                      "b": StyledTextTag(
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: ParrotColor.gray800),
                      ),
                    })
                  : Text(
                      widget.content,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ParrotColor.gray600,
                      ),
                    ),
              const SizedBox(height: 6),
              Builder(builder: (context) {
                int diff = widget.averagePrice - widget.currentPrice;
                bool priceDown = widget.currentPrice < widget.averagePrice;
                bool priceUp = widget.currentPrice > widget.averagePrice;
                bool priceSame = widget.currentPrice == widget.averagePrice;

                return Row(
                  children: [
                    if (widget.currentPrice > 0)
                      priceSame
                          ? const Text("가격 변화 없음",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: ParrotColor.gray100,
                              ))
                          : StyledText(
                              text: "<k>평균보다</k> <m>${(diff.abs()).toCommaFormat}원</m>",
                              tags: {
                                'k': StyledTextTag(
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: priceDown
                                          ? ParrotColor.blue500
                                          : priceUp
                                              ? ParrotColor.red500
                                              : ParrotColor.gray100),
                                ),
                                'm': StyledTextTag(
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: priceDown
                                        ? ParrotColor.blue500
                                        : priceUp
                                            ? ParrotColor.red500
                                            : ParrotColor.gray100,
                                  ),
                                ),
                              },
                            ),
                    Image.asset(
                      priceDown
                          ? "asset/icon/stroke_arrow_down.png"
                          : priceUp
                              ? "asset/icon/stroke_arrow_upward.png"
                              : "asset/icon/stroke_menu.png",
                      color: priceDown
                          ? ParrotColor.blue500
                          : priceUp
                              ? ParrotColor.red500
                              : ParrotColor.gray100,
                      height: 14,
                      width: 14,
                    ),
                    const Spacer(),
                    Text(
                      widget.dateTime.timeAgo,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: ParrotColor.gray400,
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
