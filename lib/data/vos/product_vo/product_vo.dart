import 'package:json_annotation/json_annotation.dart';
import 'package:product_app_challenge/data/vos/product_vo/review_vo/review_vo.dart';

part 'product_vo.g.dart';

///Data Container Class of ProductVO
@JsonSerializable()
class ProductVO {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  List<String>? tags;

  String? brands;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  ReviewVO? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  List<String>? images;
  String? thumbnail;

  ProductVO({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.tags,
    this.brands,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.images,
    this.thumbnail,
  });

  factory ProductVO.fromJson(Map<String, dynamic> json) => _$ProductVOFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$ProductVOToJson(
        this,
      );
}
