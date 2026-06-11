// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/footer.dart';
import 'package:flutter_application_1/widgets/profile_card.dart';
import 'widgets/header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPracticeScreen(),
    );
  }
}

class MyPracticeScreen extends StatelessWidget {
  const MyPracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( 
        child: SingleChildScrollView( // 📜 화면 전체 스크롤 작동!
          child: Column(
            children: [
              const Header(), 
              const ProfileCard(),
              
              // 💡 1. 에러 주범이었던 'Expanded'를 지우고, 피그마처럼 마진(여백)을 줍니다!
              const SizedBox(height: 40), 
              
              // 💡 2. 'Center' 위젯만 단독으로 남겨두면 훌륭하게 글자가 들어갑니다.
              const Center(
                child: Text(
                  'Hello Flutter!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              
              // 💡 아래쪽에도 여백을 살짝 주면 스크롤 할 때 덜 답답해요.
              const SizedBox(height: 40), 
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}