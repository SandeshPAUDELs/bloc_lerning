class Products {
  int? id;
  String? title;
  double? price;
  String? catergory;
  String? description;
  String? image;

  Products({this.id, this.title, this.price, this.catergory, this.description, this.image});
  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toDouble();
    catergory = json['catergory'];
    description = json['description'];
    image = json['image'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['catergory'] = catergory;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}