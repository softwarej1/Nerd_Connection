import 'package:flutter_getx_palette_diary/src/model/feed.dart';
import 'package:flutter_getx_palette_diary/src/repository/feed_repository.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  final Rx<List<Feed>> _feeds = Rx<List<Feed>>([]);

  var profileImagePath = ''.obs;
  List<Feed> get feeds => _feeds.value;

  final FeedRepository repository;
  FeedController({
    required this.repository,
  });

  Future<List<Feed>?> feedFetchData() async {
    // 비동기로 데이터를 가져오는 예시 코드 (repository.feedApi()가 데이터를 비동기로 반환한다고 가정)
    List<Feed>? feedList = await repository.feedApi();

    // 여기에서 필요한 처리를 수행할 수 있습니다.
    _feeds.value = feedList ?? [];
    print(feedList);
    return feedList;
  }

// 예시: feedPutData 메서드는 void 타입으로 데이터를 저장하도록 변경
  void feedPutData() {
    repository.putFeeds();
  }
}
