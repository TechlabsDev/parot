import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parot/presentation/design_component/parrot_scaffold.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return ParrotScaffold(
      horizontal16Padding: true,
      body: Column(
        children: [
          SizedBox(
            height: 108.h,
          ),
        ],
      ),
    );
  }
}
