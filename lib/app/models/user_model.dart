class UserModel {
  final String email;
  final String imageUrl;
  final String name;
  final String phoneNo;
  final String uid;
  final bool online;

  UserModel({
    required this.email,
    required this.imageUrl,
    required this.name,
    required this.phoneNo,
    required this.uid,
    required this.online,
  });

  // Static method to convert a map to a UserModel instance.
  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      phoneNo: json['phoneNo'] as String,
      uid: json['uid'] as String,
      online: json['online'] as bool,
    );
  }

  // Static method to convert UserModel data to a Map.
  static Map<String, dynamic> toJson(UserModel data) {
    return {
      'email': data.email,
      'imageUrl': data.imageUrl,
      'name': data.name,
      'phoneNo': data.phoneNo,
      'uid': data.uid,
      'online': data.online,
    };
  }
}
