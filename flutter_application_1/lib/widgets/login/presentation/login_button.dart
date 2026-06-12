// lib/widgets/login/login_button.dart
import 'package:flutter/material.dart';
// 💡 이제 버튼 안에서 직접 이동하지 않으므로 go_router 임포트는 지우셔도 됩니다!

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // 🚨 기존의 고정된 { context.go('/main'); } 코드를 지우고,
      // 🛡️ 부모가 인자로 넘겨준 onPressed 리모컨을 그대로 꽂아줍니다!
      onPressed: onPressed, 
      
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text(
        'Sign In',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}