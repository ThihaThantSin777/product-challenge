import 'package:product_app_challenge/data/vos/category_vo/category_vo.dart';
import 'package:product_app_challenge/data/vos/product_vo/product_vo.dart';
import 'package:product_app_challenge/network/data_agent/product_data_agent.dart';
import 'package:product_app_challenge/network/data_agent/product_data_agent_impl.dart';

/// Data Model Layer of Product Model
class ProductModel {
  ProductModel._();

  static final ProductModel _singleton = ProductModel._();

  factory ProductModel() => _singleton;

  final ProductDataAgent _productDataAgent = ProductDataAgentImpl();

  /// Get Categories
  Future<List<CategoryVO>?> getCategories() => _productDataAgent.getCategoryList();

  /// Get Products
  Future<List<ProductVO>?> getProducts() => _productDataAgent.getProductList();
}
