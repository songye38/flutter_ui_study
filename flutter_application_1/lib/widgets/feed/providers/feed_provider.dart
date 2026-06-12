import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final dio = Dio();

// 💡 1. 피드 목록을 서버에서 받아오는 전역 스토어 (React Query의 useQuery와 비슷합니다)
final fetchFeedsProvider = FutureProvider<List<dynamic>>((ref) async {
  // 실제 무료 가짜 데이터 API 주소입니다. (게시글 100개를 던져줍니다)
  final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
  return response.data as List<dynamic>; 
});

// 💡 2. 상세 페이지용: 피드 ID를 주면 '그 글 하나만' 서버에서 다시 가져오는 스토어
// (.family를 붙이면 외부에서 ID 같은 파라미터를 던져줄 수 있습니다)
final fetchFeedDetailProvider = FutureProvider.family<Map<String, dynamic>, String>((ref, feedId) async {
  final response = await dio.get('https://jsonplaceholder.typicode.com/posts/$feedId');
  return response.data as Map<String, dynamic>;
});