import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // 파일 상단에 임포트

class FeedActions extends StatefulWidget {
  const FeedActions({super.key});

  @override
  State<FeedActions> createState() => _FeedActionsState();
}

class _FeedActionsState extends State<FeedActions> {
  final String _tempTime = "2 hours ago";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
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
              // 1. 좋아요 아이콘
              SvgPicture.asset(
                'assets/icons/heart.svg',
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ), 
              ),
              const SizedBox(width: 12), // 아이콘과 텍스트 사이 간격
              // 2. 댓글 아이콘
              SvgPicture.asset(
                'assets/icons/message.svg',
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ), // 🎨 색상 교체 토큰
              ),
              const SizedBox(width: 12), // 아이콘과 텍스트 사이 간격
              // 3. 공유 아이콘
              SvgPicture.asset(
                'assets/icons/share.svg',
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ), // 🎨 색상 교체 토큰
              ),
            ],
          ), // 오른쪽 Row 끝
          // 2. 왼쪽: 타이틀 텍스트
          SvgPicture.asset(
            'assets/icons/bookmark.svg',
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
