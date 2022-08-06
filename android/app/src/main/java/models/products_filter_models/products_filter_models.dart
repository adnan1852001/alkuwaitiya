// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_null_aware_operators

class ShopProductsFilterModels {
  String? status;
  int? code;
  String? message;
  ProductsFilterData? data;
  ShopProductsFilterModels.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? ProductsFilterData.fromjson(json['data']) : null;
  }
}

class ProductsFilterData {
  productData? product;
  ProductsFilterData.fromjson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? productData.fromjson(json['product']) : null;
  }
}

class productData {
  int? id;
  int? product_id;
  String? name;
  String? image;
  String? description;
  String? price;
  String? price_after;
  String? currency;
  bool? is_discount;
  String? discount_rate;
  int? min_quantity;
  int? max_quantity;
  String? variation_key;
  bool? is_variation;
  bool? in_favorite;
  bool? in_cart;
  int? quantity_cart;
  List<String>? images = [];
  String? categories;
  List<attributesListData>? attributes;
  String? share_url;
  bool? is_new;
  bool? in_offer;
  bool? is_finish_quantity;
  String? note1;
  String? note2;
  bool? can_gift;
  productData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    price_after = json['price_after'];
    currency = json['currency'];
    is_discount = json['is_discount'];
    discount_rate = json['discount_rate'];
    min_quantity = json['min_quantity'];
    max_quantity = json['max_quantity'];
    variation_key = json['variation_key'];
    is_variation = json['is_variation'];
    in_favorite = json['in_favorite'];
    in_cart = json['in_cart'];
    quantity_cart = json['quantity_cart'];
    images = json['images'];
    json['images'].forEach((element) => images!.add(element));
    categories = json['categories'];
    json['attributes'] != null
        ? json['attributes'].forEach(
            (element) => attributes!.add(attributesListData.fromjson(element)))
        : null;
    share_url = json['share_url'];
    is_new = json['is_new'];
    in_offer = json['in_offer'];
    is_finish_quantity = json['is_finish_quantity'];
    note1 = json['note1'];
    note2 = json['note2'];
    can_gift = json['can_gift'];
  }
}

class attributesListData {
  attributesListData.fromjson(Map<String, dynamic> json) {}
}
