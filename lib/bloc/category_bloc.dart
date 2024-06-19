import 'package:product_app_challenge/bloc/base_bloc.dart';
import 'package:product_app_challenge/data/model/product_model.dart';
import 'package:product_app_challenge/data/vos/category_vo/category_vo.dart';

/// BLoC class of Category Page
class CategoryBloc extends BaseBloc {
  ///List Data of Categories
  List<CategoryVO>? _categories;

  List<CategoryVO>? get getCategories => _categories;

  ///Store Original Categories Data
  List<CategoryVO> _storeOriginalCategories = [];

  /// Model
  final ProductModel _productModel = ProductModel();

  CategoryBloc() {
    ///Fetch Categories to show at UI
    _productModel.getCategories().then((categories) {
      _categories = categories;
      _storeOriginalCategories = _categories ?? [];
      setSuccessState();
    }).catchError((error) {
      setErrorState(message: error.toString());
    });
  }

  void searchCategories(String data) {
    if (data.isNotEmpty) {
      _categories = _categories?.where((element) => element.name?.contains(data) ?? false).toList();
    } else {
      _categories = _storeOriginalCategories;
    }
    notifyListeners();
  }
}
