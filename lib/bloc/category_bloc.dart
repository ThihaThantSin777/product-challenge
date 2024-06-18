import 'package:product_app_challenge/bloc/base_bloc.dart';
import 'package:product_app_challenge/data/model/product_model.dart';
import 'package:product_app_challenge/data/vos/category_vo/category_vo.dart';

/// BLoC class of Category Page
class CategoryBloc extends BaseBloc {
  ///List Data of Categories
  List<CategoryVO>? _categories;

  List<CategoryVO>? get getCategories => _categories;

  /// Model
  final ProductModel _productModel = ProductModel();

  CategoryBloc() {
    ///Fetch Categories to show at UI
    setLoadingState();
    _productModel.getCategories().then((categories) {
      _categories = categories;
      setSuccessState();
    }).catchError((error) {
      setErrorState(message: error.toString());
    });
  }
}
