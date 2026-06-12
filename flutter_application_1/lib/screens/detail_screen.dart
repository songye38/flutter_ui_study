import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/feed/providers/feed_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends ConsumerWidget {
  final String itemId;
  const DetailScreen({super.key, required this.itemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 💡 주소창에서 넘겨받은 itemId를 보주면서 "이 ID에 맞는 상세 데이터 감시해줘" 요청!
    final asyncDetail = ref.watch(fetchFeedDetailProvider(itemId));

    return Scaffold(
      appBar: AppBar(title: Text('$itemId번 글 상세보기')),
      body: asyncDetail.when(
        data: (feed) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(feed['title'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Text(feed['body'], style: const TextStyle(fontSize: 16, color: Colors.black87)),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: () => context.pop(),
                    child: const Text('뒤로 가기'),
                  ),
                )
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('상세 데이터를 못 읽어왔어요 😢')),
      ),
    );
  }
}