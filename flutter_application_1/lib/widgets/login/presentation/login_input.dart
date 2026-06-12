// lib/widgets/login/login_input.dart
import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  const LoginInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // 💡 요기다가 쏙 꽂아주면 끝!
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: hintText,

        // 🎨 1. 배경색 채우기 스위치 켜기
        filled: true,
        // 🎨 2. 원하는 배경색 지정 (피그ma에서 소프트 그레이 Fill 주는 느낌)
        fillColor: Colors.grey.shade100,

        // 📐 테두리 스타일 정의
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide.none, // 💡 테두리 선을 아예 없애고 면 색상만 강조하고 싶다면 none을 줍니다!
        ),

        // 💡 선택(포커스) 되었을 때의 테두리를 따로 정의하고 싶다면 아래를 쓰면 됩니다.
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ), // 포커스 시 브랜드 컬러 라인
        ),
      ),
      autofocus: true,
    );
  }
}
