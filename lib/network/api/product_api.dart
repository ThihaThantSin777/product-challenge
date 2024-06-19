import 'package:dio/dio.dart';
import 'package:product_app_challenge/data/vos/category_vo/category_vo.dart';
import 'package:product_app_challenge/network/api/api_constant.dart';
import 'package:product_app_challenge/network/responses/product_response/product_response.dart';

///API Services
class ProductApi {
  final Dio _dio = Dio();

  ///Get Category List From API
  Future<List<CategoryVO>?> getCategoriesResponse() async {
    try {
      final result = await _dio.get(ApiConstant.kGetCategoriesEndPoint);
      final List<CategoryVO> categories =
          (result.data as List<dynamic>).map((e) => CategoryVO.fromJson(e as Map<String, dynamic>)).toList();
      return categories;
    } catch (error) {
      rethrow;
    }
  }

  ///Get Product List From API
  Future<ProductResponse?> getProductListResponse(String slug) async {
    try {
      final result = await _dio.get('${ApiConstant.kGetProductsEndPoint}/$slug');
      final productResponse = ProductResponse.fromJson(result.data as Map<String, dynamic>);
      return productResponse;
    } catch (error, stack) {
      rethrow;
    }
  }
}
