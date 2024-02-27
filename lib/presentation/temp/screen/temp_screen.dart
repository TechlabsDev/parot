import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/extension/int_extension.dart';
import 'package:parot/presentation/design_component/parrot_check_circle_in_row.dart';
import 'package:parot/presentation/design_component/parrot_comment_input_field.dart';
import 'package:parot/presentation/design_component/parrot_depth_header.dart';
import 'package:parot/presentation/design_component/parrot_text_style.dart';
import 'package:parot/presentation/temp/controller/temp_controller.dart';
import 'package:styled_text/styled_text.dart';

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
                    width: 380,
                    child: Row(
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
                            child: Image.network("https://picsum.photos/1022"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "닉네임은열글자까지야님, 고객센터 답변입니다",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            StyledText(text: "<pt>현재가</pt> <b>${42890.toCommaFormat}원</b>", tags: {
                              "pt": StyledTextTag(
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: ParrotColor.gray600),
                              ),
                              "b": StyledTextTag(
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: ParrotColor.gray800),
                              ),
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
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
