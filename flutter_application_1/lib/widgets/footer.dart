// lib/widgets/custom_footer.dart
import 'package:flutter/material.dart';

// 1. 껍데기 클래스 (StatefulWidget)
class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

// 2. 알맹이 클래스 (여기서 상태를 관리합니다)
class _FooterState extends State<Footer> {
  // 🎯 [React의 useState(0) 역할] 현재 어떤 탭이 선택되었는지 기억하는 상태 변수
  int _selectedIndex = 0; 
  int _previousIndex = 0; // 이전에 선택된 탭의 인덱스 (디버깅용)

  // 3. 화면을 그리는 함수 (build)
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 💡 각각의 탭에 고유 인덱스 번호(0, 1, 2, 3)를 부여합니다.
          _buildTabItem(0, "assets/Icon.png", "Feed"),
          _buildTabItem(1, "assets/Icon.png", "Network"),
          _buildTabItem(2, "assets/Icon.png", "Messages"),
          _buildTabItem(3, "assets/Icon.png", "Jobs"),
        ],
      ),
    );
  }

  // 🧱 탭 부품을 만드는 함수
  Widget _buildTabItem(int index, String imagePath, String label) {
    // 🎨 [디자이너 감각] 현재 이 탭이 활성화되었는지 여부를 판단하는 ID
    bool isActive = _selectedIndex == index;

    // 👆 탭을 클릭할 수 있도록 전체를 GestureDetector(또는 InkWell)로 감쌉니다. (React의 onClick 역할)
    return GestureDetector(
      onTap: () {
        // 🔄 [React의 setSelectIndex(index) 역할] 
        // setState를 실행해줘야 플러터가 "아! 상태가 바뀌었으니 화면을 다시 그려야겠구나!" 하고 인식합니다.
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 22,
            height: 22,
            // 🎨 활성화 상태에 따라 아이콘 색상(Color)을 다르게 줍니다.
            color: isActive ? Colors.blue : Colors.grey, 
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.blur_on, 
              size: 22,
              // 이미지가 없을 때 뜨는 임시 아이콘도 활성화되면 파란색, 아니면 회색!
              color: isActive ? Colors.blue : Colors.grey, 
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              // 🎨 활성화 상태에 따라 글자 색상도 다르게 줍니다.
              color: isActive ? Colors.blue : Colors.black54, 
            ),
          ),
        ],
      ),
    );
  }
}