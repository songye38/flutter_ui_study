// ❶ [Data Source] 진짜 순수하게 요청만 날리는 껍데기
import 'package:dio/dio.dart';

class FeedApiClient {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchRawFeeds() async {
    // 💡 try-catch 아예 없음! 에러 나면 난 대로, 성공하면 성공한 대로 위로 던짐
    final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
    return response.data as List<dynamic>;
  }
}