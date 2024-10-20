class Cart {
  int id;
  List<Product> products;
  double total;
  double discountedTotal;
  int userId;
  int totalProducts;
  int totalQuantity;

  Cart({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    List<dynamic> productsJson = json['products'];
    List<Product> products =
        productsJson.map((product) => Product.fromJson(product)).toList();
    return Cart(
      id: json['id'],
      products: products,
      total: json['total'],
      discountedTotal: json['discountedTotal'],
      userId: json['userId'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
    );
  }
}

class Product {
  int id;
  String title;
  double price;
  int quantity;
  double total;
  String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
      thumbnail: json['thumbnail'],
    );
  }
}
