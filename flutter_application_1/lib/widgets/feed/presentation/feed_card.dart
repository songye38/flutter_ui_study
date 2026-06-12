import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/widgets/feed/data/feed_repository.dart';

class FeedCard extends ConsumerWidget {
  const FeedCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ❶ 통신을 담당하는 레포지토리 객체를 생성합니다.
    final FeedRepository feedRepository = FeedRepository();

    // ❷ FutureBuilder를 'return' 해주어야 플러터가 화면에 그립니다!
    return FutureBuilder<List<dynamic>>(
      future: feedRepository.getFeeds(), // 📡 데이터를 가져오는 주체
      builder: (context, snapshot) {
        
        // 🔄 케이스 1: 아직 서버에서 데이터를 가져오는 중일 때 (로딩)
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: CircularProgressIndicator(), // 빙글빙글 로딩 바
            ),
          );
        }

        // 🚨 케이스 2: 레포지토리에서 try-catch에 걸려 에러가 넘어왔을 때 (에러)
        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                '데이터를 불러오지 못했습니다 😢\n(${snapshot.error})',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        // 🎁 케이스 3: 데이터가 무사히 도착했을 때 (표현)
        // snapshot.data 안에 레포지토리가 리턴해준 List<dynamic>이 들어있습니다.
        final feeds = snapshot.data ?? [];

        if (feeds.isEmpty) {
          return const Center(child: Text('표시할 피드가 없습니다.'));
        }

        // 🧱 가져온 데이터를 리스트 형태로 예쁘게 렌더링(표현)합니다.
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: feeds.length > 10 ? 10 : feeds.length, // 일단 최대 10개만 출력
          itemBuilder: (context, index) {
            final feed = feeds[index];
            
            return ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(
                feed['title'] ?? '제목 없음',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                feed['body'] ?? '내용 없음',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              onTap: () {
                // 💡 리스트를 누르면 go_router를 이용해 상세 페이지로 이동!
                context.push('/detail/${feed['id']}');
              },
            );
          },
        );
      },
    );
  }
}