// lib/widgets/login/login_button.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // 💡 메인 화면으로 전환 (뒤로가기로 로그인창 못 돌아옴)
        context.go('/main');
      },
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
