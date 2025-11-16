import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _service = ProductService();

  List<Product> _allProducts = [];
  List<Product> _recommendedProducts = [];
  String _selectedCategory = "Chicken"; 
  String get selectedCategory => _selectedCategory;

  bool _loadingAll = false;
  bool _loadingRecommended = false;

  String? _error;

  List<Product> get allProducts => _allProducts;
  List<Product> get recommendedProducts => _recommendedProducts;
  bool get loadingAll => _loadingAll;
  bool get loadingRecommended => _loadingRecommended;
  String? get error => _error;

  //  all prod
  Future<void> fetchAllProducts() async {
    _loadingAll = true;
    notifyListeners();
    try {
      _allProducts = await _service.getProducts();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loadingAll = false;
      notifyListeners();
    }
  }


  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }


    List<Product> get filteredProducts {
    if (_selectedCategory == "All") return _allProducts;
    return _allProducts.where((p) => p.category == _selectedCategory).toList();
  }


  
    List<Product> get recommendedFilteredProducts {
    if (_selectedCategory == "All") return _recommendedProducts;
    return _recommendedProducts.where((p) => p.category == _selectedCategory).toList();
  }

  //  recomended one...
  Future<void> fetchRecommended() async {
    _loadingRecommended = true;
    notifyListeners();

    try {
      _recommendedProducts = await _service.getRecommendedProducts();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loadingRecommended = false;
      notifyListeners();
    }
  }


}
