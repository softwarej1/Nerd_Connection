import 'package:freezed_annotation/freezed_annotation.dart';

part 'join.freezed.dart';
part 'join.g.dart';

@freezed
class Join with _$Join {
  factory Join(
      {required String id,
      required String name,
      required String password}) = _Join;
  factory Join.fromJson(Map<String, dynamic> json) => _$JoinFromJson(json);
}
