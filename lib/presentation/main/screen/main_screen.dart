import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/data/source/request/product_detail_request.dart';
import 'package:parot/domain/usecase/product/get_product_detail.dart';
import 'package:parot/domain/usecase/product/open_coupang.dart';
import 'package:parot/presentation/main/controller/main_controller.dart';

import '../../../const/enum/login_type.dart';
import '../../design_component/parot_scaffold.dart';
import '../../design_component/price_graph.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX<MainController>(
        init: Get.put(MainController()),
        builder: (controller) {
          return ParrotScaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilder<MainController>(
                      init: Get.put(MainController()),
                      builder: (controller) {
                        return PriceGraph(
                          priceList: controller.priceList,
                        );
                      }),
                  const SizedBox(height: 20),
                  controller.loginType.value == SignInType.none
                      ? Column(
                          children: [
                            ElevatedButton(
                              onPressed: controller.signIn.handleKakaoSignIn,
                              child: const Text("카카오 로그인"),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: controller.signIn.handleNaverSignIn,
                              child: const Text("네이버 로그인"),
                            ),
                            if (GetPlatform.isWeb) const SizedBox(height: 20),
                            if (GetPlatform.isWeb)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: "상품id를 입력하면 쿠팡으로 이동",
                                  ),
                                  autofocus: true,
                                  onSubmitted: (value) async {
                                    OpenCoupang().call(productId: value);
                                    InsertProductDataToDB()
                                        .call(request: ProductDetailRequest(productId: "6329328037", itemId: "874629318"));
                                  },
                                ),
                              ),
                          ],
                        )
                      : Column(
                          children: [
                            Text("${controller.loginType.value.korName}로 로그인 됨"),
                            ElevatedButton(
                              onPressed: controller.signIn.signOut,
                              child: const Text("로그아웃"),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: "상품id를 입력하면 쿠팡으로 이동",
                                ),
                                autofocus: true,
                                onSubmitted: (value) async {
                                  OpenCoupang().call(productId: value);
                                  InsertProductDataToDB().call(request: ProductDetailRequest(productId: "6329328037", itemId: "874629318"));
                                },
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          );
        });
  }
}
