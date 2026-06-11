import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        // 💡 버튼 2개를 화면 가로 안에서 균등하게 분배합니다.
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          // 🔵 1. 첫 번째 버튼: 배경이 채워진 버튼 (예: 팔로우)
          ElevatedButton(
            // 💡 onPressed: 버튼을 누르면 실행할 기능을 적는 방입니다. (지금은 비워둘게요!)
            onPressed: () {}, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 버튼 배경색
              foregroundColor: Colors.white, // 글자색
              minimumSize: const Size(137, 48), // 💡 송이님이 원하셨던 너비 137, 높이 48 고정!
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // 모서리 둥글기 12
              ),
            ),
            child: const Text("Follow", style: TextStyle(fontWeight: FontWeight.bold)),
          ),

          // ⚪ 2. 두 번째 버튼: 테두리만 있는 버튼 (예: 메시지)
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue, // 글자 및 선 색상
              minimumSize: const Size(137, 48), // 💡 똑같이 너비 137, 높이 48 고정!
              side: const BorderSide(color: Colors.blue, width: 1.5), // 테두리 선 굵기
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Message", style: TextStyle(fontWeight: FontWeight.bold)),
          ),

        ],
      ),
    );
  }
}