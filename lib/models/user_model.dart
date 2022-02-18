class User {

  String email;
  String name;
  String role;

  User({
    required this.email,
    required this.name,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
