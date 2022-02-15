
class Category {

  String? id;
  String description;
  bool status;

  Category({
    this.id,
    required this.description,
    required this.status,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"] ?? "",
    description: json["description"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "status": status,
  };
}
