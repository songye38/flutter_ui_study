// ❷ [Repository] 여기서 온갖 에러를 종류별로 접수해서 분류함
import 'package:dio/dio.dart';
import 'package:flutter_application_1/widgets/feed/data/feed_api_client.dart';

class FeedRepository {
  final FeedApiClient _apiClient = FeedApiClient();

  Future<List<dynamic>> getFeeds() async {
    try {
      // 💣 만약 여기서 에러가 콰광 터지면?
      return await _apiClient.fetchRawFeeds(); 
      
    } on DioException catch (e) {
      // 💡 1. "아, 날아온 폭탄을 까보니 인터넷/서버 통신 에러(DioException)네!"
      print("네트워크 에러 접수: ${e.message}");
      throw Exception("서버 연결이 원활하지 않습니다.");
      
    } on TypeError catch (e) {
      // 💡 2. "아, 날아온 폭탄을 보니 데이터 타입이 안 맞는 에러(TypeError)네!"
      print("타입 에러 접수: 데이터 형식이 리스트가 아닙니다. $e");
      throw Exception("데이터를 읽어오는 중 오류가 발생했습니다.");
      
    } catch (e) {
      // 💡 3. 그 외의 모든 알 수 없는 에러들
      print("기타 에러 접수: $e");
      throw Exception("알 수 없는 오류가 발생했습니다.");
    }
  }
}