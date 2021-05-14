class Product {
  String _id;
  String _title;
  String _description;

  Product({String id, String title, String description}) {
    this._id = id;
    this._title = title;
    this._description = description;
  }

  String get id => _id;

  set id(String id) => _id = id;

  String get title => _title;

  set title(String title) => _title = title;

  String get description => _description;

  set description(String description) => _description = description;

  Product.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['description'] = this._description;
    return data;
  }
}
