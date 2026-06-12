import 'package:flutter_riverpod/legacy.dart';

// 1. 상태를 관리하는 알맹이 클래스 (Zustand의 상태와 액션 정의와 같습니다)
class NavigationNotifier extends StateNotifier<int> {
  // 초기값을 0(첫 번째 탭)으로 설정합니다.
  NavigationNotifier() : super(0);

  // 💡 인덱스를 변경하는 액션 함수 (Zustand의 set() 역할)
  void setIndex(int index) {
    state = index; // state가 바뀌면 이걸 감시하는 위젯들이 알아서 리렌더링됩니다.
  }
}

// 2. 외부에서 접근할 수 있도록 빨대를 꽂을 수 있는 '전역 스토어 변수'를 개방합니다.
final navigationProvider = StateNotifierProvider<NavigationNotifier, int>((ref) {
  return NavigationNotifier();
});