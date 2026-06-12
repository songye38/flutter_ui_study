// lib/widgets/custom_footer.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/feed/feed_actions.dart';
import 'package:go_router/go_router.dart';

// 1. 껍데기 클래스 (StatefulWidget)
class FeedContent extends StatefulWidget {
  const FeedContent({super.key});

  @override
  State<FeedContent> createState() => _FeedContentState();
}

// 2. 알맹이 클래스 (여기서 상태를 관리합니다)
class _FeedContentState extends State<FeedContent> {
  // 🎯 [React의 useState(0) 역할] 현재 어떤 탭이 선택되었는지 기억하는 상태 변수
  final String _tempContent =
      "The future of workspace productivity is here. Exploring the intersection of tactile feedback andminimalist aesthetics.";
  final List<String> _tempTags = [
    'TechDesign',
    'Productivity',
    'MechanicalKeyboard',
  ];

  // 3. 화면을 그리는 함수 (build)
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ), // 위아래, 양옆 여백 살짝 추가
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 💡 기존에 회색 박스로 만들어둔 플레이스홀더 Container 자리에 이걸 넣으시면 됩니다!
          Container(
            width: double.infinity, // 💡 가로 너비를 부모 박스(FeedCard) 크기에 꽉 맞춥니다.
            height: 300, // 📐 피드 이미지의 세로 높이 설정
            decoration: BoxDecoration(
              // 피드 이미지에도 부드러운 감각을 주려면 테두리 곡률을 살짝 줍니다. (완전 직각을 원하시면 지우셔도 돼요!)
              borderRadius: BorderRadius.circular(12),

              // 🖼️ 여기에 실제 서버나 인터넷에서 가져온 피드 메인 이미지를 넣습니다.
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?auto=format&fit=crop&w=800&q=80', // 예시 그래픽 이미지
                ),
                fit: BoxFit
                    .cover, // 💡 피그마의 'Fill' 모드! 이미지 비율 깨짐 없이 사각형 상자에 꽉 채웁니다.
              ),
            ),
          ),
          const SizedBox(height: 12), // 이미지와 텍스트 사이 간격
          FeedActions(),
          GestureDetector(
            onTap: () {
              // 💡 클릭 시 123번 피드 상세 페이지로 이동 (context.push 사용)
              context.push('/detail/123');
            },
            child: Text(
              _tempContent,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),

          const SizedBox(height: 4),
          // ... 뒤쪽 태그 관련 코드는 그대로 유지
          const SizedBox(height: 4),
          Text(
            _tempTags.map((tag) => '#$tag').join(' '),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.purple,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
