import 'package:flutter/material.dart';

class ProfileTags extends StatelessWidget {
  const ProfileTags({super.key});

  @override
  Widget build(BuildContext context) {
    // 💡 1. 반드시 'return'으로 위젯을 시작해야 에러가 안 납니다!
    return Container(
      child: Wrap(
        spacing: 4.0, // ↔️ 태그와 태그 사이의 가로 간격
        runSpacing: 8.0, // ↕️ 줄과 줄 사이의 세로 간격
        children: [
          Container(
            // 🎨 1. 안쪽 여백 (피그마의 Padding과 동일)
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),

            // 🎨 2. 배경색과 테두리 둥글기 디자인
            decoration: BoxDecoration(
              color: Colors.purple[50], // 연한 회색 배경색
              borderRadius: BorderRadius.circular(4), // 살짝 둥근 모서리
            ),

            // 📝 3. 알맹이가 되는 텍스트 위젯
            child: const Text(
              "SENIOR UX DESIGNER",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(
                  255,
                  85,
                  10,
                  132,
                ), // 배경이 밝아졌으니 글자색을 조금 더 어둡게 조절!
              ),
            ),
          ),
          Container(
            // 🎨 1. 안쪽 여백 (피그마의 Padding과 동일)
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),

            // 🎨 2. 배경색과 테두리 둥글기 디자인
            decoration: BoxDecoration(
              color: Colors.purple[50], // 연한 회색 배경색
              borderRadius: BorderRadius.circular(4), // 살짝 둥근 모서리
            ),

            // 📝 3. 알맹이가 되는 텍스트 위젯
            child: const Text(
              "SENIOR UX",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(
                  255,
                  85,
                  10,
                  132,
                ), // 배경이 밝아졌으니 글자색을 조금 더 어둡게 조절!
              ),
            ),
          ),
          Container(
            // 🎨 1. 안쪽 여백 (피그마의 Padding과 동일)
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),

            // 🎨 2. 배경색과 테두리 둥글기 디자인
            decoration: BoxDecoration(
              color: Colors.purple[50], // 연한 회색 배경색
              borderRadius: BorderRadius.circular(4), // 살짝 둥근 모서리
            ),

            // 📝 3. 알맹이가 되는 텍스트 위젯
            child: const Text(
              "SENIOR UX DESIGNER",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(
                  255,
                  85,
                  10,
                  132,
                ), // 배경이 밝아졌으니 글자색을 조금 더 어둡게 조절!
              ),
            ),
          ),
        ],
      ),
    ); // 💡 세미콜론으로 확실하게 마무리!
  }
}
