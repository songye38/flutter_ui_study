import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // 파일 상단에 임포트

class FeedHeader extends StatefulWidget {
  const FeedHeader({super.key});

  @override
  State<FeedHeader> createState() => _FeedHeaderState();
}

class _FeedHeaderState extends State<FeedHeader> {
  final String _tempTime = "2 hours ago";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ), // 위아래, 양옆 여백 살짝 추가
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. 이미지와 정보
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 24, // 💡 64px 높이에 맞게 살짝 줄였습니다.
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=200&q=80',
                ),
              ),
              const SizedBox(width: 12), // 프사와 텍스트 사이 간격
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'TechFlow',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4), // 텍스트 위아래 간격
                  Text(
                    _tempTime,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ), // 오른쪽 Row 끝
          // 2. 왼쪽: 타이틀 텍스트
          SvgPicture.asset(
            'assets/icons/dots-horizontal.svg',
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              Colors.black,
              BlendMode.srcIn,
            ), // 🎨 색상 교체 토큰
          ),
        ],
      ),
    ); // Container 끝
  }
}
