// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      content: json['content'] as String?,
      photo_url: json['photo_url'] as String?,
      share_check: json['share_check'] as bool?,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'photo_url': instance.photo_url,
      'share_check': instance.share_check,
    };
