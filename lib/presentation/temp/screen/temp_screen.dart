import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/design_component/parrot_check_circle_in_row.dart';
import 'package:parot/presentation/design_component/parrot_comment_input_field.dart';
import 'package:parot/presentation/design_component/parrot_depth_header.dart';
import 'package:parot/presentation/design_component/parrot_text_style.dart';
import 'package:parot/presentation/temp/controller/temp_controller.dart';

import '../../design_component/parrot_alarm_cell.dart';
import '../../design_component/parrot_check_circle.dart';
import '../../design_component/parrot_color.dart';
import '../../design_component/parrot_comment_cell.dart';
import '../../design_component/parrot_scaffold.dart';
import '../../design_component/parrot_switch.dart';

//아직 디자인이 다 나오지 않았을 때, 컴포넌트만 개발할 때 임시로 쓸 화면
class TempScreen extends StatefulWidget {
  const TempScreen({Key? key}) : super(key: key);

  @override
  State<TempScreen> createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX<TempController>(
      init: Get.put(TempController()),
      builder: (controller) {
        return ParrotScaffold(
          appBar: ParrotDepthHeader(
            title: Text("뎁스 들어간 페이지", style: parrotDepthHeaderStyle),
            actions: [
              IconButton(onPressed: () {}, icon: Image.asset("asset/icon/stroke_share.png", height: 24, width: 24)),
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  ParrotSwitch(
                    value: controller.switchValue.value,
                    onChanged: (value) {
                      controller.switchValue.value = value;
                    },
                    activeColor: ParrotColor.red500,
                  ),
                  Text("토글 스위치 ${controller.switchValue.isTrue ? "켜짐" : "꺼짐"}"),
                  const SizedBox(height: 20),
                  ParrotCheckCircle(
                    value: controller.checkCircleValue.value,
                    onChanged: (value) {
                      controller.checkCircleValue.value = value;
                    },
                  ),
                  Text("체크박스 ${controller.checkCircleValue.isTrue ? "켜짐" : "꺼짐"}"),
                  const SizedBox(height: 20),
                  ParrotCheckCircleInRow(
                    value: controller.checkCircleInRowValue.value,
                    onChanged: (value) {
                      controller.checkCircleInRowValue.value = value;
                    },
                    titleText: Text(
                      "전체 약관 동의 ${controller.checkCircleInRowValue.isTrue ? "함" : "안함"}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: ParrotCheckCircleInRow(
                      value: controller.checkCircleInRowValue2.value,
                      onChanged: (value) {
                        controller.checkCircleInRowValue2.value = value;
                      },
                      titleText: Text(
                        "(필수) 이용 약관 동의 ${controller.checkCircleInRowValue2.isTrue ? "함" : "안함"}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "보기",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: ParrotColor.gray500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 40),
                  SizedBox(
                    width: 380,
                    child: ParrotCommentCell(
                      userImageUrl: "https://picsum.photos/1024",
                      userNickname: "닉네임은열글자까지야",
                      dateTime: DateTime.now(),
                      content: "댓글 내용이 나옴 " * 8,
                      likeCount: 1209,
                      onRecommentTap: () {},
                      commentCount: 2098,
                    ),
                  ),
                  SizedBox(
                    width: 380,
                    child: ParrotCommentCell(
                      userImageUrl: "https://picsum.photos/1023",
                      userNickname: "도레미파솔라시도",
                      dateTime: DateTime.now(),
                      content: "@닉네임은열글자까지야" + " 대댓글 내용이 나옴 " * 8,
                      likeCount: 1209,
                      onRecommentTap: () {},
                      recommentTargetNicknameList: ["닉네임은열글자까지야"],
                      commentCount: 2098,
                      isRecomment: true,
                    ),
                  ),
                  SizedBox(
                    width: 380,
                    child: ParrotCommentCell(
                      userImageUrl: "https://picsum.photos/1021",
                      userNickname: "돼지고기먹고싶다",
                      dateTime: DateTime.now(),
                      content: "@도레미파솔라시도 @닉네임은열글자까지야" + " 대댓글 내용이 나옴 " * 8,
                      likeCount: 1209,
                      onRecommentTap: () {},
                      recommentTargetNicknameList: ["도레미파솔라시도", "닉네임은열글자까지야"],
                      commentCount: 2098,
                      isRecomment: true,
                    ),
                  ),
                  const Divider(height: 40),
                  SizedBox(
                    width: 340,
                    child: ParrotAlarmCell(
                      productImage: "https://picsum.photos/1022",
                      title: "YOUNCO 화장실 젠다이 선반 무타공 선반 악기",
                      content: "상품 설명이 나옴",
                      currentPrice: 28000,
                      averagePrice: 8000,
                      dateTime: DateTime.now(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 340,
                    child: ParrotAlarmCell(
                      productImage: "https://picsum.photos/1029",
                      title: "우리 집에서 직구! 따끈따끈한 내 방 산소",
                      content: "상품 설명이 나옴",
                      currentPrice: 3500,
                      averagePrice: 25000,
                      dateTime: DateTime.now().subtract(const Duration(minutes: 30)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 340,
                    child: ParrotAlarmCell(
                      productImage: "https://picsum.photos/1032",
                      title: "지하철 무제한 왕복 이용권 1+1",
                      content: "상품 설명이 나옴",
                      currentPrice: 500000,
                      averagePrice: 500000,
                      dateTime: DateTime.now().subtract(const Duration(hours: 3)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 340,
                    child: ParrotAlarmCell(
                      productImage: "https://picsum.photos/1220",
                      title: "[직관] 주커버그 VS 머스크 죽음의 댄스배틀",
                      content: "안녕하세요. 닉네임은열글자까지야 님, 문의주신 상품은 현재 가격정보가 쌓이지 않았습니다",
                      currentPrice: -1,
                      averagePrice: -1,
                      dateTime: DateTime.now().subtract(const Duration(days: 1)),
                    ),
                  ),
                  const Divider(height: 40),
                  SizedBox(
                    width: 300,
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              "가격 변동 그래프",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "타이밍 BAD...",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: ParrotColor.red500,
                          ),
                        ),
                        const Text(
                          "평균가보다 훨씬 비싸요. 지금 사면 안돼요",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: ParrotColor.red500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            CustomPaint(
                              size: const Size(300, 200),
                              foregroundPainter: ChartPainter(
                                color: ParrotColor.red500,
                                priceList: [300, 250, 300, 400, 380, 200, 220, 130, 350, 360, 320, 200, 400, 300, 430],
                              ),
                            ),
                            Text("iejqpo"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 300),
                ],
              ),
            ),
          ),
          bottomSheet: ParrotCommentInputField(
            hintText: "@haedong, @inho 대댓글 UI 나옴",
            commentTargetList: ["haedong", "inho"],
          ),
        );
      },
    );
  }
}

class ChartPainter extends CustomPainter {
  final Color color;
  final List<int> priceList;

  ChartPainter({
    required this.color,
    required this.priceList,
  });

  @override
  void paint(Canvas canvas, Size size) {
    int highestPrice = priceList.reduce((value, element) => value > element ? value : element);
    /*
      size.height : highestPrice = p : price
      p * highestPrice = size.height * price
      p = (size.height * price) / highestPrice

      size.width : priceList.length = x : i
      x * priceList.length = size.width * i
      x = (size.width * i) / priceList.length
    */
    Paint linePaint = Paint()
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..color = color;

    Paint pointPaint = Paint()
      ..strokeWidth = 12.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = color;

    Paint pointCenterPaint = Paint()
      ..strokeWidth = 7.0
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = Colors.white;

    Path path = Path();
    path.moveTo(0, size.height - ((size.height * priceList[0]) / highestPrice));
    Offset offset = const Offset(0, 0);
    for (int i = 1; i < priceList.length; i++) {
      offset = Offset((size.width * i) / priceList.length, size.height - ((size.height * priceList[i]) / highestPrice));
      path.lineTo(offset.dx, offset.dy);
      canvas.drawPath(path, linePaint);
    }
    canvas.drawPoints(PointMode.points, [offset], pointPaint);
    canvas.drawPoints(PointMode.points, [offset], pointCenterPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
