import 'package:json_annotation/json_annotation.dart';
import 'package:product_app_challenge/data/vos/product_vo/product_vo.dart';

part 'product_response.g.dart';

///Data Container Response Class of Product Service API
@JsonSerializable()
class ProductResponse {
  List<ProductVO>? products;

  ProductResponse({
    this.products,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) => _$ProductResponseFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$ProductResponseToJson(
        this,
      );
}
