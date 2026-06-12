import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/profile/presentation/profile_buttons.dart';
import 'package:flutter_application_1/widgets/profile/presentation/profile_stats.dart';
import 'package:flutter_application_1/widgets/profile/presentation/profile_tags.dart';
import 'profile_header.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    // 💡 1. 현재 스마트폰 화면의 가로 크기를 알아내서 변수에 담습니다.
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16),
      // 💡 2. 화면 전체 너비에 0.8을 곱해서 정확히 80% 크기로 고정합니다!
      width: screenWidth * 0.8,

      // 🎨 구분이 잘 가도록 임시로 배경색과 테두리를 넣어볼게요! (원하시면 지우셔도 됩니다)
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // 내부 콘텐츠 크기에 맞게 카드 높이 조절
          children: const [
            ProfileHeader(),
            SizedBox(height: 24), // 헤더와 스탯 사이 간격
            ProfileStats(),
            SizedBox(height: 24), // 헤더와 스탯 사이 간격
            ProfileButtons(),
            SizedBox(height: 24), // 헤더와 스탯 사이 간격
            ProfileTags()
          ],
        ),
      ),
    );
  }
}
