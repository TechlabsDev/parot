import 'package:flutter/material.dart';
import 'package:parot/presentation/design_component/parrot_scaffold.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return ParrotScaffold();
  }
}
