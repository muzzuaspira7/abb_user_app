import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductService {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection('products');

  // get all products
  Future<List<Product>> getProducts() async {
    final snapshot = await _productsRef.get();
    return snapshot.docs
        .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
//  recomended one...
  Future<List<Product>> getRecommendedProducts() async {
    final snapshot = await _productsRef.where('isRecommended', isEqualTo: true).get();
    return snapshot.docs
        .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }


}
