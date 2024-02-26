import 'package:flutter/material.dart';
import 'package:parot/presentation/design_component/parrot_scaffold.dart';
import 'package:parot/presentation/design_component/parrot_search_header.dart';

class TempSearchScreen extends StatefulWidget {
  const TempSearchScreen({Key? key}) : super(key: key);

  @override
  State<TempSearchScreen> createState() => _TempSearchScreenState();
}

class _TempSearchScreenState extends State<TempSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return ParrotScaffold(
      appBar: ParrotSearchHeader(
        hintText: "URL 또는 검색어를 입력해주세요",
        onSubmit: (str) {
          print(str);
        },
      ),
    );
  }
}
