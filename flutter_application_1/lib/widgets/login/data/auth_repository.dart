// lib/data/repositories/auth_repository.dart
import 'package:dio/dio.dart';
import 'package:flutter_application_1/widgets/login/data/auth_api_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final AuthApiClient _apiClient = AuthApiClient();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<bool> login(String email, String password) async {
    try {
      // 1. 서버에 요청을 날려 응답 객체를 받습니다.
      final response = await _apiClient.executeLogin(email, password);
      
      // 2. HTTP 응답 헤더에서 'set-cookie' 목록을 추출합니다.
      final List<String>? cookies = response.headers['set-cookie'];
      
      String? accessToken;

      if (cookies != null) {
        // 3. [쿠키 파싱 로직] 쿠키 배열을 돌면서 access_token을 찾습니다.
        for (var cookie in cookies) {
          if (cookie.contains('access_token=')) {
            // 예: "access_token=ey...; Max-Age=1800;" -> ["access_token=ey...", "Max-Age=1800;"]
            final rawTokenPair = cookie.split(';')[0]; 
            // "access_token=ey..." -> "ey..." (진짜 토큰 값만 추출)
            accessToken = rawTokenPair.split('=')[1];
            break;
          }
        }
      }

      // 4. 추출한 토큰이 있다면 안전하게 내부 금고에 저장!
      if (accessToken != null && accessToken.isNotEmpty) {
        await _storage.write(key: 'accessToken', value: accessToken);
        print("레포지토리: 🍪 쿠키에서 access_token 탈취 성공 및 금고 저장 완료! 🔐");
        return true;
      }

      print("레포지토리: 통신은 성공했으나 쿠키에서 토큰을 찾지 못했습니다.");
      return false;

    } on DioException catch (e) {
      // 백엔드가 뱉은 400 에러(HTTPException)는 일로 떨어집니다.
      if (e.response != null && e.response?.data != null) {
        print("🚨 백엔드 로그인 실패 사유: ${e.response?.data['detail']}");
      } else {
        print("네트워크 통신 터짐: ${e.message}");
      }
      return false;
    } catch (e) {
      print("알 수 없는 에러 감지: $e");
      return false;
    }
  }
}