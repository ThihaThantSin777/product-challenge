import 'package:product_app_challenge/bloc/base_bloc.dart';
import 'package:product_app_challenge/data/model/product_model.dart';
import 'package:product_app_challenge/data/vos/product_vo/product_vo.dart';

///BLoC class of Product List Page
class ProductListBloc extends BaseBloc {
  ///List Data of Products
  List<ProductVO>? _products;

  List<ProductVO>? get getProducts => _products;

  /// Model
  final ProductModel _productModel = ProductModel();

  ProductListBloc() {
    ///Fetch Products to show at UI
    setLoadingState();
    _productModel.getProducts().then((products) {
      _products = products;
      setSuccessState();
    }).catchError((error) {
      setErrorState(message: error.toString());
    });
  }
}
