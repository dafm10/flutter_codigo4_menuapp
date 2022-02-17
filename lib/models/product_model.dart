
class Product {

  String? id;
  String category;
  String image;
  int rate;
  double price;
  String origin;
  String name;
  List<String> ingredients;
  int discount;
  String description;
  int time;
  bool status;

  Product({
    this.id,
    required this.category,
    required this.image,
    required this.rate,
    required this.price,
    required this.origin,
    required this.name,
    required this.ingredients,
    required this.discount,
    required this.description,
    required this.time,
    required this.status,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"] ?? "",
    category: json["category"],
    image: json["image"],
    rate: json["rate"],
    price: json["price"].toDouble(),
    origin: json["origin"],
    name: json["name"],
    ingredients: List<String>.from(json["ingredients"].map((x) => x)),
    discount: json["discount"],
    description: json["description"],
    time: json["time"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "image": image,
    "rate": rate,
    "price": price,
    "origin": origin,
    "name": name,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
    "discount": discount,
    "description": description,
    "time": time,
    "status": status,
  };
}