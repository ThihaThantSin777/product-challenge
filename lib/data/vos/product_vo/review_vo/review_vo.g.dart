// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewVO _$ReviewVOFromJson(Map<String, dynamic> json) => ReviewVO(
      rating: (json['rating'] as num?)?.toDouble(),
      comment: json['comment'] as String?,
      data: json['data'] as String?,
      reviewerName: json['reviewerName'] as String?,
      reviewerEmail: json['reviewerEmail'] as String?,
    );

Map<String, dynamic> _$ReviewVOToJson(ReviewVO instance) => <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'data': instance.data,
      'reviewerName': instance.reviewerName,
      'reviewerEmail': instance.reviewerEmail,
    };
