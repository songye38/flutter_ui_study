// lib/widgets/custom_footer.dart
import 'package:flutter/material.dart';

// 1. 껍데기 클래스 (StatefulWidget)
class FeedLikes extends StatefulWidget {
  const FeedLikes({super.key});

  @override
  State<FeedLikes> createState() => _FeedLikesState();
}

// 2. 알맹이 클래스 (여기서 상태를 관리합니다)
class _FeedLikesState extends State<FeedLikes> {
  // 🎯 [React의 useState(0) 역할] 현재 어떤 탭이 선택되었는지 기억하는 상태 변수
  final int _tempLikesCount = 1248;

  // 3. 화면을 그리는 함수 (build)
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: 
      Text(
        "$_tempLikesCount likes",
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}