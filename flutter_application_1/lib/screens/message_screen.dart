// lib/screens/detail_screen.dart
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 💡 넘겨받은 진짜 제목(title)을 상단 앱바에 띄워줍니다!
      appBar: AppBar(title: Text('메세지 페이지')), 

    );
  }
}