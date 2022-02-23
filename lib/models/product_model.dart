
class Product {

  String id;
  String? category;
  String image;
  int? rate;
  double price;
  String? origin;
  String name;
  List<String>? ingredients;
  int? discount;
  String? description;
  int? time;
  bool? status;
  int? quantity;

  Product({
    required this.id,
    this.category,
    required this.image,
    this.rate,
    required this.price,
    this.origin,
    required this.name,
    this.ingredients,
    this.discount,
    this.description,
    this.time,
    this.status,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"] ?? "",
    category: json["category"] ?? "",
    image: json["image"],
    rate: json["rate"] ?? 0,
    price: json["price"].toDouble(),
    origin: json["origin"] ?? "",
    name: json["name"],
    ingredients: json["ingredients"] != null ? List<String>.from(json["ingredients"].map((x) => x)) : [],
    discount: json["discount"] ?? 0,
    description: json["description"] ,
    time: json["time"] ?? 0,
    status: json["status"] ?? false,
    quantity: json["quantity"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "category": category ?? "",
    "image": image,
    "rate": rate ?? 0,
    "price": price,
    "origin": origin ?? "",
    "name": name,
    "ingredients": ingredients != null ? List<dynamic>.from(ingredients!.map((x) => x)) : [],
    "discount": discount ?? 0,
    "description": description ?? "",
    "time": time ?? 0,
    "status": status ?? false,
    "quantity": quantity ?? 0,
  };
}