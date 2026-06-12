// lib/screens/detail_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatelessWidget {
  final String itemId; 
  final String title; // 💡 넘겨받을 '글 제목' 변수를 추가합니다!

  // 💡 생성자(Constructor)에도 title을 필수로 받도록 추가해 줍니다.
  const DetailScreen({
    super.key, 
    required this.itemId,
    required this.title, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 💡 넘겨받은 진짜 제목(title)을 상단 앱바에 띄워줍니다!
      appBar: AppBar(title: Text(title)), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 본문에도 넘겨받은 ID와 제목을 써먹을 수 있어요.
            Text(
              '[$itemId번 피드] 내용 상세보기',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                context.pop(); 
              },
              child: const Text('뒤로 가기'),
            ),
          ],
        ),
      ),
    );
  }
}