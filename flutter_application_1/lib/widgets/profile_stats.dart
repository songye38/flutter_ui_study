import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 🎨 카드의 느낌을 살리기 위해 위아래 패딩을 살짝 줄게요.
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        // 💡 spaceAround는 피그마 오토레이아웃의 'Space Between'처럼 요소를 가로로 예쁘게 분배합니다.
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 📊 첫 번째 스탯 (예: 게시글/프로젝트 수)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Column(
              children: const [
                Text(
                  "142", // 🔢 숫자 강조!
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4), // 숫자와 텍스트 사이 간격
                Text(
                  "Followers",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ), // 👈 Column 방 닫기
          ), // 👈 Container 방 닫기
          // 📊 두 번째 스탯 (예: 팔로워 수)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Column(
              children: const [
                Text(
                  "2.5k",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "Projects",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Column(
              children: const [
                Text(
                  "2.5k",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "Rating",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
