import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/banner_model.dart';

class BannerProvider with ChangeNotifier {
  List<BannerModel> _banners = [];

  List<BannerModel> get banners => _banners;

  Future<void> fetchBanners() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('banners').get();

      _banners = snapshot.docs
          .map((doc) => BannerModel.fromMap(doc.data(), doc.id))
          .toList();

      notifyListeners(); 
    } catch (e) {
      debugPrint("Error fetching banners: $e");
    }
  }
}
