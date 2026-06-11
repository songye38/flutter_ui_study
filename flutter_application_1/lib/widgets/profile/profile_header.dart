import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // 💡 1. 반드시 'return'으로 위젯을 시작해야 에러가 안 납니다!
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 💡 2. 프로필 이미지와 초록색 점을 '겹쳐서' 배치하기 위해 Stack을 씁니다!
          // 피그ma에서 absolute position(절대 위치) 준 것과 같아요.
          Stack(
            children: [
              const CircleAvatar(
                radius: 120, // 지름 240의 큰 프로필 사진
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=200&q=80',
                ),
              ),
              // 🟢 온라인 상태 표시 초록색 점을 프로필 우측 하단에 딱 붙이기!
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 32, // 아바타가 크니까 점도 살짝 키웠어요!
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9999),
                    color: const Color(0xff10b981),
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ), // 흰색 테두리를 주면 더 프로페셔널해 보입니다!
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Text(
            "Alex Rivera",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
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
                color: Color.fromARGB(255, 85, 10, 132), // 배경이 밝아졌으니 글자색을 조금 더 어둡게 조절!
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "Senior UX Designer at TechFlow. Passionate about building accessible and human-centric digital experiences.",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ); // 💡 세미콜론으로 확실하게 마무리!
  }
}
