import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/design_component/parrot_depth_header.dart';
import 'package:parot/presentation/design_component/parrot_scaffold.dart';
import 'package:parot/presentation/design_component/parrot_text_style.dart';
import 'package:parot/presentation/temp/controller/temp_controller.dart';

import '../../design_component/parrot_color.dart';
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
