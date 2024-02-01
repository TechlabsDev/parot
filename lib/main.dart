import 'package:flutter/material.dart';
import 'package:parot/domain/usecase/sign_in/sign_in_with_kakao.dart';
import 'package:parot/presentation/design_component/price_graph.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PriceGraph(),
            ElevatedButton(
              onPressed: () async => await SignInWithKakao().call(),
              child: Text("카카오 로그인"),
            ),
          ],
        ),
      ),
    );
  }
}
