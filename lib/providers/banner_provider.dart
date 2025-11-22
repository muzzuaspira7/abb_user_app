import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/banner_model.dart';

class BannerProvider with ChangeNotifier {
  List<BannerModel> _banners = [];
  int _currentBannerIndex = 0;
  List<BannerModel> get banners => _banners;
  int get currentBannerIndex => _currentBannerIndex;
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

  void setCurrentBannerIndex(int index) {
    _currentBannerIndex = index;
    notifyListeners();
  }
}
