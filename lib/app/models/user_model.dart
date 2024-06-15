class UserModel {
  String email;
  String imageUrl;
  String name;
  String phoneNo;
  String uid;
  bool online;
  UserModel({
    required this.email,
    required this.imageUrl,
    required this.name,
    required this.phoneNo,
    required this.uid,
    required this.online,
  });

  // Factory constructor to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      phoneNo: json['phoneNo'],
      uid: json["uid"],
      online: json["online"],
    );
  }

  // Method to convert a UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'imageUrl': imageUrl,
      'name': name,
      'phoneNo': phoneNo,
      "uid": uid,
      "online": online,
    };
  }
}
