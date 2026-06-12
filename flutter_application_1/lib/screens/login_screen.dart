import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/widgets/login/presentation/login_input.dart';
import 'package:flutter_application_1/widgets/login/presentation/login_button.dart';
import 'package:flutter_application_1/widgets/login/data/auth_repository.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 🔑 리액트의 useState 대신 텍스트를 통제할 컨트롤러를 선언합니다.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // 🏢 매니저(레포지토리) 소환
  final AuthRepository _authRepository = AuthRepository();

  @override
  void dispose() {
    // 메모리 누수 방지를 위해 컨트롤러를 해제해 줍니다 (리액트의 clean-up 느낌)
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // lib/screens/login_screen.dart 내부의 _handleLogin 함수

  void _handleLogin() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    // 1. 쿠키 탈취 및 금고 저장 대기
    final isSuccess = await _authRepository.login(email, password);

    if (isSuccess) {
      if (!mounted) return;

      // 🚨 기존 Navigator.pushReplacement(...) 코드는 싹 지워버리세요!
      // 🛡️ 프로젝트 라우터 규약에 맞게 go_router 명령어로 대전환합니다.
      // (메인 화면 경로가 '/main'인지 '/feed'인지 라우터 설계도에 적어둔 경로로 맞춰주세요!)
      context.go('/main');
      print("🚀 go_router를 통해 메인 화면으로 안전하게 진입했습니다.");
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('이메일 또는 비밀번호가 올바르지 않습니다.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'TechFlow',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 40),

              Text("Email Address"),
              const SizedBox(height: 8),
              // 💡 자식 인풋 컴포넌트에 부모의 리모컨(컨트롤러)을 배달해 줍니다.
              LoginInput(
                hintText: 'name@company.com',
                controller: _emailController,
              ),
              const SizedBox(height: 16),

              Text("Password"),
              const SizedBox(height: 8),
              LoginInput(
                hintText: '••••••••',
                isPassword: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 24),

              // 💡 액션 함수 연결
              LoginButton(onPressed: _handleLogin),
            ],
          ),
        ),
      ),
    );
  }
}
