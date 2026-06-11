// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/common/footer.dart';
import 'package:flutter_application_1/widgets/profile/profile_card.dart';
import 'package:flutter_application_1/widgets/feed/feed_card.dart'; 
import 'widgets/common/header.dart';

// 💡 [수정] 1단계: 우리가 만든 로그인 스크린을 임포트합니다.
import 'package:flutter_application_1/screens/login_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // 💡 [수정] 2단계: 앱이 켜졌을 때 메인이 아니라 '로그인 페이지'를 대문으로 띄웁니다!
      home: LoginScreen(), 
    );
  }
}

// 📌 로그인 성공 후 유저가 진입하게 될 진짜 메인 껍데기 화면
class MyPracticeScreen extends StatefulWidget {
  const MyPracticeScreen({super.key});

  @override
  State<MyPracticeScreen> createState() => _MyPracticeScreenState();
}

class _MyPracticeScreenState extends State<MyPracticeScreen> {
  int _currentIndex = 0;

  final List<Widget> _bodyScreens = [
    const ProfileCard(), 
    const FeedCard(),    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( 
        child: SingleChildScrollView( 
          child: Column(
            children: [
              const Header(), 
              _bodyScreens[_currentIndex],
              const SizedBox(height: 40), 
              const Center(
                child: Text(
                  'Hello Flutter!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40), 
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; 
          });
        },
      ),
    );
  }
}