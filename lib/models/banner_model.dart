class BannerModel {
  final String id;     
  final String imageUrl;
  final String title;
  final String subtitle;

  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  factory BannerModel.fromMap(Map<String, dynamic> map, String docId) {
    return BannerModel(
      id: docId,
      imageUrl: map['imageUrl'] ?? '',
      title: map['title'] ?? 'Delicious Biryani Delivered Fast!',
      subtitle: map['subtitle'] ?? 'Hot & Fresh to Your Doorstep',
    );
  }
}
