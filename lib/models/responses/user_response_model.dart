class UserModel {
  User? user;
  List<Warehouses>? warehouses;
  String? token;
  String? type;
  int? expiresIn;

  UserModel(
      {this.user, this.warehouses, this.token, this.type, this.expiresIn});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['warehouses'] != null) {
      warehouses = <Warehouses>[];
      json['warehouses'].forEach((v) {
        warehouses!.add(new Warehouses.fromJson(v));
      });
    }
    token = json['token'];
    type = json['type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.warehouses != null) {
      data['warehouses'] = this.warehouses!.map((v) => v.toJson()).toList();
    }
    data['token'] = this.token;
    data['type'] = this.type;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? surname;
  String? email;
  String? branch;
  int? status;

  User(
      {this.id, this.name, this.surname, this.email, this.branch, this.status});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    email = json['email'];
    branch = json['branch'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['email'] = this.email;
    data['branch'] = this.branch;
    data['status'] = this.status;
    return data;
  }
}

class Warehouses {
  int? branchCode;
  String? branch;
  String? warehouse;

  Warehouses({this.branchCode, this.branch, this.warehouse});

  Warehouses.fromJson(Map<String, dynamic> json) {
    branchCode = json['branch_code'];
    branch = json['branch'];
    warehouse = json['warehouse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_code'] = this.branchCode;
    data['branch'] = this.branch;
    data['warehouse'] = this.warehouse;
    return data;
  }
}
