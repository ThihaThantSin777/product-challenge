///API Constant
class ApiConstant {
  ///Base URL
  static const _kBaseURL = 'https://dummyjson.com';

  ///List Of Categories EndPoint
  static const kGetCategoriesEndPoint = '$_kBaseURL/products/categories';

  ///List of Product List by Category Slug EndPoint
  static const kGetProductsEndPoint = '$_kBaseURL/products/category';
}
