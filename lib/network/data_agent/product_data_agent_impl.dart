import 'package:product_app_challenge/data/vos/category_vo/category_vo.dart';
import 'package:product_app_challenge/data/vos/product_vo/product_vo.dart';
import 'package:product_app_challenge/network/api/product_api.dart';
import 'package:product_app_challenge/network/data_agent/product_data_agent.dart';

class ProductDataAgentImpl extends ProductDataAgent {
  ProductDataAgentImpl._();

  static final ProductDataAgentImpl _singleton = ProductDataAgentImpl._();

  factory ProductDataAgentImpl() => _singleton;

  final ProductApi _productApi = ProductApi();

  @override
  Future<List<CategoryVO>?> getCategoryList() => _productApi.getCategoriesResponse();

  @override
  Future<List<ProductVO>?> getProductList() async {
    try {
      final productResponse = await _productApi.getProductListResponse();
      return productResponse?.products;
    } catch (error) {
      rethrow;
    }
  }
}
