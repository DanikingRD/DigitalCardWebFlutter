class UserModel {
  final String uid;
  final String name;
  final String email;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson({
    required String uid,
    required String name,
    required String email,
  }) {
    return UserModel(
      uid: uid,
      name: name,
      email: email,
    );
  }

  Map<String, String> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
    };
  }
}
