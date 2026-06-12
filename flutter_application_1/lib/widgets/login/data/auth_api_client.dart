// lib/data/data_sources/auth_api_client.dart
import 'package:dio/dio.dart';

class AuthApiClient {
  final Dio _dio = Dio();

  // 💡 Map이 아니라 Dio의 Response 객체를 그대로 리턴해서 헤더까지 넘겨줍니다.
  Future<Response> executeLogin(String email, String password) async {
    final response = await _dio.post(
      'https://api.enerlog.kr/users/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    return response;
  }
}