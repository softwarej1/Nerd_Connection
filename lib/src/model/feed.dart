import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed.freezed.dart';
part 'feed.g.dart';

@freezed
class Feed with _$Feed {
  factory Feed({
    required String? photo_url,
    required int? post_no,
  }) = _Feed;
  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}
