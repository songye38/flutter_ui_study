// lib/widgets/network_header.dart
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // 양옆 여백
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양끝으로 찢기
        children: [
          // 왼쪽: 타이틀 텍스트
          const Text(
            "Network",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.justify,
          ),
          
          // 오른쪽: 아이콘 묶음 (Row 안에 또 Row!)
          Row(
            children: [
              const Icon(Icons.search, size: 28),
              const SizedBox(width: 16), // 아이콘 사이 간격 (Margin 역할)
              const Icon(Icons.notifications_none, size: 28),
            ],
          ),
        ],
      ),
    );
  }
}