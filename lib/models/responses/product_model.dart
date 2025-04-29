class ProductModel {
  String? code;
  String? name;
  String? description;
  String? type;
  String? category;
  double? price;
  int? stock;
  String? branch;
  String? warehouse;
  int? status;

  ProductModel(
      {this.code,
        this.name,
        this.description,
        this.type,
        this.category,
        this.price,
        this.stock,
        this.branch,
        this.warehouse,
        this.status});

  ProductModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    category = json['category'];
    price = double.tryParse(json['price'].toString()) ?? 0.0;
    stock = json['stock'];
    branch = json['branch'];
    warehouse = json['warehouse'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['description'] = description;
    data['type'] = type;
    data['category'] = category;
    data['price'] = price;
    data['stock'] = stock;
    data['branch'] = branch;
    data['warehouse'] = warehouse;
    data['status'] = status;
    return data;
  }
}
