import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/model/feed.dart';

import 'package:flutter_getx_palette_diary/src/utils/api_url.dart';

class FeedRepository {
  final dio = Dio();

  Future<List<Feed>?> feedApi() async {
    try {
      final response = await dio.get(ApiUrls.feedUrl);

      if (response.statusCode == 200) {
        List<Feed> feeds = [];
        for (var data in response.data) {
          final feed = Feed.fromJson(data);
          feeds.add(feed);
        }
        return feeds;
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> putFeeds() async {
    try {
      dio.get(ApiUrls.feedUrl).then((response) {
        if (response.statusCode == 200) {
        } else {
          // exception
        }
        return Feed.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }
}
