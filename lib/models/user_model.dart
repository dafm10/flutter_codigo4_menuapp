class UserModel {

  String email;
  String name;
  String role;

  UserModel({
    required this.email,
    required this.name,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    name: json["name"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "name": name,
    "role": role,
  };
}
