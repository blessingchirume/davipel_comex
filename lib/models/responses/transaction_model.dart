class TransactionModel {
  int? id;
  int? customerId;
  String? ref;
  String? currency;
  int? item;
  int? units;
  double? price;
  String? docDate;
  String? dueDate;
  String? docNum;
  String? docEntry;
  int? status;
  Timestamps? timestamps;
  String? pod;
  List<OrderItems>? orderItems;

  TransactionModel(
      {this.id,
        this.customerId,
        this.ref,
        this.currency,
        this.item,
        this.units,
        this.price,
        this.docDate,
        this.dueDate,
        this.docNum,
        this.docEntry,
        this.status,
        this.timestamps,
        this.pod,
        this.orderItems});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    ref = json['ref'];
    currency = json['currency'];
    item = json['item'];
    units = json['units'];
    price = json['price'];
    docDate = json['doc_date'];
    dueDate = json['due_date'];
    docNum = json['doc_num'];
    docEntry = json['doc_entry'];
    status = json['status'];
    timestamps = json['timestamps'] != null
        ? Timestamps.fromJson(json['timestamps'])
        : null;
    pod = json['pod'];
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['ref'] = ref;
    data['currency'] = currency;
    data['item'] = item;
    data['units'] = units;
    data['price'] = price;
    data['doc_date'] = docDate;
    data['due_date'] = dueDate;
    data['doc_num'] = docNum;
    data['doc_entry'] = docEntry;
    data['status'] = status;
    if (timestamps != null) {
      data['timestamps'] = timestamps!.toJson();
    }
    data['pod'] = pod;
    if (orderItems != null) {
      data['order_items'] = orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timestamps {
  String? createDate;
  String? approvalDate;
  String? deliveryDate;

  Timestamps({this.createDate, this.approvalDate, this.deliveryDate});

  Timestamps.fromJson(Map<String, dynamic> json) {
    createDate = json['create_date'];
    approvalDate = json['approval_date'];
    deliveryDate = json['delivery_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['create_date'] = createDate;
    data['approval_date'] = approvalDate;
    data['delivery_date'] = deliveryDate;
    return data;
  }
}

class OrderItems {
  int? orderId;
  String? name;
  String? code;
  int? quantity;
  double? price;
  double? priceTotal;
  String? tax;

  OrderItems(
      {this.orderId,
        this.name,
        this.code,
        this.quantity,
        this.price,
        this.priceTotal,
        this.tax});

  OrderItems.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    name = json['name'];
    code = json['code'];
    quantity = json['quantity'];
    price = json['price'];
    priceTotal = json['price_total'];
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['name'] = name;
    data['code'] = code;
    data['quantity'] = quantity;
    data['price'] = price;
    data['price_total'] = priceTotal;
    data['tax'] = tax;
    return data;
  }
}
