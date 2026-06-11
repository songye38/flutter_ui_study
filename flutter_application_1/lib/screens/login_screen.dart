// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
// 💡 분리한 컴포넌트(부품)들 임포트
import 'package:flutter_application_1/widgets/login/login_input.dart';
import 'package:flutter_application_1/widgets/login/login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              // 1. 브랜드 로고 (텍스트)
              const Text(
                'TechFlow',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              const SizedBox(height: 40),

              // 2. 이메일 인풋 컴포넌트 조립
              Text("Email Address"),
              const SizedBox(height: 8),
              const LoginInput(hintText: 'name@company.com'),
              const SizedBox(height: 16),

              // 3. 비밀번호 인풋 컴포넌트 조립
              Text("Password"),
              const SizedBox(height: 8),
              const LoginInput(hintText: '••••••••', isPassword: true),
              const SizedBox(height: 24),

              // 4. 로그인 버튼 컴포넌트 조립 및 액션 연결
              LoginButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyPracticeScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}