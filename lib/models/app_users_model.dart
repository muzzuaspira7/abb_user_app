class AppUser {
  final String uid;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? pincode;
  final List<String> savedAddresses;
  final String? lastOrderId;
  final int totalOrders;
  final int createdAt; 

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.pincode,
    this.savedAddresses = const [],
    this.lastOrderId,
    this.totalOrders = 0,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() => {
        "uid": uid,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "pincode": pincode,
        "savedAddresses": savedAddresses,
        "lastOrderId": lastOrderId,
        "totalOrders": totalOrders,
        "createdAt": createdAt,
      };

  factory AppUser.fromMap(Map<String, dynamic> map) => AppUser(
        uid: map["uid"],
        name: map["name"],
        email: map["email"],
        phone: map["phone"],
        address: map["address"],
        pincode: map["pincode"],
        savedAddresses: List<String>.from(map["savedAddresses"] ?? []),
        lastOrderId: map["lastOrderId"],
        totalOrders: map["totalOrders"] ?? 0,
        createdAt: map["createdAt"] ?? DateTime.now().millisecondsSinceEpoch,
      );
}
