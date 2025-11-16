class Product {
  final String id; 
  final String name;
  final String description;
  final String type; 
  final String serves; 
  final int price;
  final String portion;
  final String label; 
  final String imageUrl;
  final String category; 

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.serves,
    required this.price,
    required this.portion,
    required this.label,
    required this.imageUrl,
    required this.category,
  });

  factory Product.fromMap(Map<String, dynamic> map, String docId) {
    return Product(
      id: docId,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      type: map['type'] ?? '',
      serves: map['serves'] ?? '',
      price: map['price'] ?? 0,
      portion: map['portion'] ?? '',
      label: map['label'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      category: map['category'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'type': type,
      'serves': serves,
      'price': price,
      'portion': portion,
      'label': label,
      'imageUrl': imageUrl,
      'category': category,
    };
  }
}
