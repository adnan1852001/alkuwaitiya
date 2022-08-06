// ignore_for_file: non_constant_identifier_names

class ShopFavoriteModel {
  bool? status;
  int? code;
  String? message;
  int? page_count;
  int? result_count;
  List<FavoriteData>? data = [];
  ShopFavoriteModel.fromjson(Map<dynamic, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    page_count = json['page_count'];
    result_count = json['result_count'];
    json['data']
        .forEach((element) => data!.add(FavoriteData.fromjson(element)));
  }
}

class FavoriteData {
  int? id;
  int? product_id;
  String? image;
  String? thumb_image;
  String? name;
  int? price;
  int? price_after;
  String? currency;
  bool? is_discount;
  bool? in_offer;
  String? favorite_date;

  FavoriteData.fromjson(Map<dynamic, dynamic> json) {
    id = json['id'];
    product_id = json['product_id'];
    image = json['image'];
    thumb_image = json['thumb_image'];
    name = json['name'];
    price = json['price'];
    price_after = json['price_after'];
    currency = json['currency'];
    is_discount = json['is_discount'];
    in_offer = json['in_offer'];
    favorite_date = json['favorite_date'];
  }
}
