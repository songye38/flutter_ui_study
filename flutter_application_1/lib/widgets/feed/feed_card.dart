import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/feed/feed_comments.dart';
import 'package:flutter_application_1/widgets/feed/feed_content.dart';
import 'package:flutter_application_1/widgets/feed/feed_header.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16),
      width: screenWidth * 0.9, // 화면 전체 너비의 80% 고정
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        // 💡 피그마의 'Hug contents' 역할! 자식 컴포넌트들의 높이 합만큼만 딱 맞추어 카드가 생깁니다.
        mainAxisSize: MainAxisSize.min, 
        children: [
          // 📌 1. 상단 고정 영역: 프로필 헤더
          const FeedHeader(),
          
          // 🔄 2. 본문 및 댓글 영역 (🚨 무한대 충돌을 일으키던 Expanded를 뺐습니다!)
          // 바깥 화면이 어차피 스크롤이 되므로, 내부는 자연스럽게 늘어나도록 둡니다.
          const SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(), // 외부 스크롤과 겹치지 않게 내부 스크롤 기능은 잠금 처리
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FeedContent(),  // 📝 피드 본문
                SizedBox(height: 12),
                SizedBox(height: 16),
                FeedComments(), // 💬 댓글 리스트
              ],
            ),
          ),


          
        ],
      ),
    );
  }
}