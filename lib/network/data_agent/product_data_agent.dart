import 'package:product_app_challenge/data/vos/category_vo/category_vo.dart';
import 'package:product_app_challenge/data/vos/product_vo/product_vo.dart';

/// Data Agent Layer
abstract class ProductDataAgent {
  ///Get Category List
  Future<List<CategoryVO>?> getCategoryList();

  ///Get Product List
  Future<List<ProductVO>?> getProductList(String slug);
}
