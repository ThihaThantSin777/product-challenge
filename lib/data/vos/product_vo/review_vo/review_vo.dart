import 'package:json_annotation/json_annotation.dart';

part 'review_vo.g.dart';

///Data Container Class of ReviewVO
@JsonSerializable()
class ReviewVO {
  double? rating;
  String? comment;
  String? data;
  String? reviewerName;
  String? reviewerEmail;

  ReviewVO({
    this.rating,
    this.comment,
    this.data,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory ReviewVO.fromJson(Map<String, dynamic> json) => _$ReviewVOFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$ReviewVOToJson(
        this,
      );
}
