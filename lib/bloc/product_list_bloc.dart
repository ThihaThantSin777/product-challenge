import 'package:product_app_challenge/bloc/base_bloc.dart';
import 'package:product_app_challenge/data/model/product_model.dart';
import 'package:product_app_challenge/data/vos/product_vo/product_vo.dart';

///BLoC class of Product List Page
class ProductListBloc extends BaseBloc {
  ///List Data of Products
  List<ProductVO>? _products;

  List<ProductVO>? get getProducts => _products;

  ///Store Original Products Data
  List<ProductVO> _storeOriginalProducts = [];

  /// Model
  final ProductModel _productModel = ProductModel();

  ProductListBloc({
    required String slug,
  }) {
    ///Fetch Products to show at UI
    setLoadingState();
    _productModel.getProducts(slug).then((products) {
      _products = products;
      _storeOriginalProducts = _products ?? [];
      setSuccessState();
    }).catchError((error) {
      setErrorState(message: error.toString());
    });
  }

  void searchProduct(String data) {
    if (data.isNotEmpty) {
      _products = _products?.where((element) => element.title?.contains(data) ?? false).toList();
    } else {
      _products = _storeOriginalProducts;
    }
    notifyListeners();
  }
}
