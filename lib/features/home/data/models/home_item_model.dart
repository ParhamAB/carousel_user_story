class HomeItem {
  String? type;
  String? title;
  String? image;
  String? price;
  String? city;
  String? presenter;
  String? runtime;
  String? rate;
  String? url;
  String? id;

  HomeItem(
      {this.type,
      this.title,
      this.image,
      this.price,
      this.city,
      this.presenter,
      this.runtime,
      this.rate,
      this.url,
      this.id});

  HomeItem.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    city = json['city'];
    presenter = json['presenter'];
    runtime = json['runtime'];
    rate = json['rate'];
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['title'] = title;
    data['image'] = image;
    data['price'] = price;
    data['city'] = city;
    data['presenter'] = presenter;
    data['runtime'] = runtime;
    data['rate'] = rate;
    data['url'] = url;
    data['id'] = id;
    return data;
  }
}
