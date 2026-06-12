// lib/screens/detail_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatelessWidget {
  final String itemId; // 넘겨받을 데이터 (예: 피드 ID)

  const DetailScreen({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('상세 페이지 ($itemId)')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // go_router 방식으로 뒤로 가기
            context.pop(); 
          },
          child: const Text('뒤로 가기'),
        ),
      ),
    );
  }
}