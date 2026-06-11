// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/common/footer.dart';
import 'package:flutter_application_1/widgets/profile/profile_card.dart';
// 💡 1. 새로 만든 FeedCard 파일을 불러옵니다! (경로는 송이님 구조에 맞게 체크!)
import 'package:flutter_application_1/widgets/feed/feed_card.dart'; 
import 'widgets/common/header.dart';

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

// 💡 2. 탭 번호를 '기억'해야 하므로 StatelessWidget에서 StatefulWidget으로 변신합니다!
class MyPracticeScreen extends StatefulWidget {
  const MyPracticeScreen({super.key});

  @override
  State<MyPracticeScreen> createState() => _MyPracticeScreenState();
}

class _MyPracticeScreenState extends State<MyPracticeScreen> {
  // 🔢 현재 어떤 탭이 선택되었는지 기억하는 방 (0: 프로필, 1: 피드)
  int _currentIndex = 0;

  // 📺 각 탭 번호에 매칭될 '본문 알맹이 화면' 리스트를 미리 준비합니다.
  final List<Widget> _bodyScreens = [
    const ProfileCard(), // 0번 탭을 누르면 보여줄 상자
    const FeedCard(),    // 1번 탭을 누르면 보여줄 상자 (새로 만든 것!)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( 
        child: SingleChildScrollView( 
          child: Column(
            children: [
              const Header(), 
              
              // 💡 3. 핵심 조건문 등장! 
              // 현재 선택된 인덱스(_currentIndex)에 따라 프로필 카드 혹은 피드 카드를 쏙 갈아 끼웁니다.
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
      // 💡 4. 하단 푸터에게 "지금 몇 번 탭이 켜졌는지"와 "탭이 눌렸을 때 알려달라"고 구멍을 뚫어줍니다.
      bottomNavigationBar: Footer(
        currentIndex: _currentIndex,
        onTap: (index) {
          // 🔄 사용자가 새 탭을 누르면 setState를 통해 화면을 새로고침(리렌더링) 합니다!
          setState(() {
            _currentIndex = index; 
          });
        },
      ),
    );
  }
}