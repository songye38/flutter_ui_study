// lib/main.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // 💡 go_router 임포트

import 'package:flutter_application_1/widgets/common/footer.dart';
import 'package:flutter_application_1/widgets/profile/profile_card.dart';
import 'package:flutter_application_1/widgets/feed/feed_card.dart';
import 'widgets/common/header.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/detail_screen.dart'; // 상세페이지 임포트

// 💡 [수정] 앱 전체의 라우터(지도)를 정의합니다.
final GoRouter _router = GoRouter(
  initialLocation: '/login', // 앱이 처음 켜지면 로그인 화면으로!
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/main',
      builder: (context, state) => const MyPracticeScreen(),
    ),
    // 데이터(id)를 받아서 상세페이지로 가는 경로
    GoRoute(
      path: '/detail/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '0';
        // 💡 state.extra에서 보따리를 꺼냅니다.
        final data = state.extra as Map<String, String>?;

        return DetailScreen(itemId: id, title: data?['title'] ?? '제목 없음');
      },
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 💡 [수정] MaterialApp.router를 사용하고 주입합니다.
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

// (MyPracticeScreen 클래스는 기존 코드 그대로 유지됩니다!)
class MyPracticeScreen extends StatefulWidget {
  const MyPracticeScreen({super.key});

  @override
  State<MyPracticeScreen> createState() => _MyPracticeScreenState();
}

class _MyPracticeScreenState extends State<MyPracticeScreen> {
  int _currentIndex = 0;
  final List<Widget> _bodyScreens = [const ProfileCard(), const FeedCard()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              SearchBar(
                hintText: '검색어를 입력하세요',
                leading: const Icon(Icons.search),
                trailing: [
                  IconButton(icon: const Icon(Icons.tune), onPressed: () {}),
                ],
                onChanged: (value) => print(value),
              ),
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
