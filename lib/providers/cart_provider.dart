import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<CartItem> _items = [];
  double deliveryFee = 50;

  List<CartItem> get items => _items;

  double get subtotal =>
      _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  double get total => subtotal + deliveryFee;

  // ----------------- Load Cart from Firebase -----------------
  Future<void> loadCart() async {
    final uid = _auth.currentUser!.uid;
    final snapshot = await _firestore.collection('users').doc(uid).collection('cart').get();
    _items = snapshot.docs.map((doc) => CartItem.fromMap(doc.id, doc.data())).toList();
    notifyListeners();
  }

  // ----------------- Add Item to Cart -----------------
  Future<void> addToCart(CartItem item) async {
    final uid = _auth.currentUser!.uid;

    final existingIndex = _items.indexWhere((e) => e.id == item.id);
    if (existingIndex >= 0) {
      _items[existingIndex].quantity += 1;
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(item.id)
          .update({'quantity': _items[existingIndex].quantity});
    } else {
      _items.add(item);
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(item.id)
          .set(item.toMap());
    }
    notifyListeners();
  }

  // ----------------- Remove Item -----------------
  Future<void> removeItem(CartItem item) async {
    final uid = _auth.currentUser!.uid;
    _items.removeWhere((e) => e.id == item.id);
    await _firestore.collection('users').doc(uid).collection('cart').doc(item.id).delete();
    notifyListeners();
  }

  // ----------------- Increase / Decrease Quantity -----------------
  Future<void> increaseQty(CartItem item) async {
    final uid = _auth.currentUser!.uid;
    final index = _items.indexWhere((e) => e.id == item.id);
    if (index >= 0) {
      _items[index].quantity += 1;
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(item.id)
          .update({'quantity': _items[index].quantity});
      notifyListeners();
    }
  }

  Future<void> decreaseQty(CartItem item) async {
    final uid = _auth.currentUser!.uid;
    final index = _items.indexWhere((e) => e.id == item.id);
    if (index >= 0 && _items[index].quantity > 1) {
      _items[index].quantity -= 1;
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(item.id)
          .update({'quantity': _items[index].quantity});
    } else {
      removeItem(item);
    }
    notifyListeners();
  }

  // ----------------- Checkout -----------------
  Future<void> checkout() async {
    if (_items.isEmpty) return;

    final uid = _auth.currentUser!.uid;
    final orderRef = _firestore.collection('users').doc(uid).collection('orders').doc();

    await orderRef.set({
      'items': _items.map((e) => e.toMap()).toList(),
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'total': total,
      'timestamp': FieldValue.serverTimestamp(),
    });

    // Clear Cart
    for (var item in _items) {
      await _firestore.collection('users').doc(uid).collection('cart').doc(item.id).delete();
    }
    _items.clear();
    notifyListeners();
  }
}

