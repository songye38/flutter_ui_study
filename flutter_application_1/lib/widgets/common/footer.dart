// lib/widgets/custom_footer.dart
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  // 💡 [핵심] main.dart로부터 현재 번호와 탭 눌림 알림 함수를 받아올 구멍(Property)을 뚫습니다.
  final int currentIndex;
  final ValueChanged<int> onTap;

  const Footer({
    super.key,
    required this.currentIndex, // main.dart가 "지금 0번 탭이야" 하고 알려줄 값
    required this.onTap,        // 사용자가 탭을 누르면 main.dart에게 "몇 번 눌렸어!" 하고 던져줄 함수
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        // 🎨 디자인 감각을 살려 상단에 은은한 구분선 보더를 줄게요.
        border: Border(
          top: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 💡 내장된 함수에 고유 인덱스(0, 1, 2, 3)를 전달합니다.
          _buildTabItem(0, "activity.svg", "Feed"),
          _buildTabItem(1, "activity.svg", "Profile"), // 💡 메인 싱크에 맞게 1번을 Profile로 매칭하거나 순서를 맞추시면 됩니다!
          _buildTabItem(2, "activity.svg", "Messages"),
          _buildTabItem(3, "activity.svg", "My"),
        ],
      ),
    );
  }

  // 🧱 탭 부품을 만드는 함수
  Widget _buildTabItem(int index, String imagePath, String label) {
    // 🎨 main.dart에서 넘겨받은 currentIndex와 이 탭의 index가 같으면 불이 켜집니다!
    bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () {
        // 👆 사용자가 탭을 꾹 누르면, 자기가 가지고 있는 고유 번호(index)를 바깥 메인 화면으로 던집니다!
        onTap(index);
      },
      child: Container(
        // 💡 터치 영역 확장을 위해 투명 배경을 깔아주면 디자이너 입장에서 스페이스 히트맵 짤 때 좋습니다.
        color: Colors.transparent, 
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 22,
              height: 22,
              color: isActive ? Colors.blue : Colors.grey, 
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.blur_on, 
                size: 22,
                color: isActive ? Colors.blue : Colors.grey, 
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isActive ? Colors.blue : Colors.black54, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}