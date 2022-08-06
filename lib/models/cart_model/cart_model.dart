// ignore_for_file: non_constant_identifier_names

class ShopCartModel {
  bool? status;
  int? code;
  String? message;
  CartData? data;
  ShopCartModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? CartData.fromjson(json['data']) : null;
  }
}

class CartData {
  List<ProductsList>? products = [];
  int? count_products;
  int? count_quantity;
  String? price;
  String? price_after;
  String? price_with_tax;
  String? price_before_tax;
  String? price_without_tax;
  String? price_after_discount_coupon;
  String? total_price;
  String? tax;
  String? tax_percentage;
  String? tax_text;
  bool? is_bill;
  List<CouponsAutomatic>? coupons_automatic = [];
  List<AdminDiscounts>? admin_discounts = [];
  String? coupon_price;
  String? coupon_automatic_price;
  String? currency;
  int? currency_id;
  int? exchange_rate;
  String? shipping;
  String? cash_value;
  String? first_order_discount;
  ShippingCompanyData? shipping_company;
  PackageData? package;
  CouponData? coupon;
  CartData.fromjson(Map<String, dynamic> json) {
    json['products']
        .forEach((element) => products!.add(ProductsList.fromjson(element)));
    json['coupons_automatic'].forEach((element) =>
        coupons_automatic!.add(CouponsAutomatic.fromjson(element)));
    json['admin_discounts'].forEach(
        (element) => admin_discounts!.add(AdminDiscounts.fromjson(element)));
    count_products = json['count_products'];
    count_quantity = json['count_quantity'];
    price = json['price'];
    price_after = json['price_after'];
    price_with_tax = json['price_with_tax'];
    price_before_tax = json['price_before_tax'];
    price_without_tax = json['price_without_tax'];
    price_after_discount_coupon = json['price_after_discount_coupon'];
    total_price = json['total_price'];
    tax = json['tax'];
    tax_percentage = json['tax_percentage'];
    tax_text = json['tax_text'];
    is_bill = json['is_bill'];
    coupon_price = json['coupon_price'];
    coupon_automatic_price = json['coupon_automatic_price'];
    currency = json['currency'];
    currency_id = json['currency_id'];
    exchange_rate = json['exchange_rate'];
    shipping = json['shipping'];
    cash_value = json['cash_value'];
    first_order_discount = json['first_order_discount'];
    // data = json['data'] != null ? CartData.fromjson(json['data']) : null;
    shipping_company = json['shipping_company'] != null
        ? ShippingCompanyData.fromjson(json['shipping_company'])
        : null;
    package =
        json['package'] != null ? PackageData.fromjson(json['package']) : null;
    coupon =
        json['coupon'] != null ? CouponData.fromjson(json['coupon']) : null;
  }
}

class ProductsList {
  int? id;
  int? cart_product_id;
  int? product_variation_id;
  String? key;
  String? name;
  String? image;
  String? thumb_image;
  int? min_quantity;
  int? max_quantity;
  int? quantity;
  String? price;
  String? price_after;
  String? discount_price;
  String? total_price;
  String? price_without_tax;
  bool? is_discount;
  String? brand_name;
  String? tax;
  String? currency;
  bool? is_trashed;
  int? can_gift;
  ProductsList.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    cart_product_id = json['cart_product_id'];
    product_variation_id = json['product_variation_id'];
    key = json['key'];
    name = json['name'];
    image = json['image'];
    thumb_image = json['thumb_image'];
    min_quantity = json['min_quantity'];
    max_quantity = json['max_quantity'];
    quantity = json['quantity'];
    price = json['price'];
    price_after = json['price_after'];
    discount_price = json['discount_price'];
    total_price = json['total_price'];
    price_without_tax = json['price_without_tax'];
    is_discount = json['is_discount'];
    brand_name = json['brand_name'];
    tax = json['tax'];
    currency = json['currency'];
    is_trashed = json['is_trashed'];
    can_gift = json['can_gift'];
  }
}

class CouponsAutomatic {
  CouponsAutomatic.fromjson(Map<String, dynamic> json);
}

class AdminDiscounts {
  AdminDiscounts.fromjson(Map<String, dynamic> json);
}

class ShippingCompanyData {
  int? id;
  String? name;
  String? type;
  int? amount;
  String? amount_text;
  String? to_price_text;
  String? original_price_text_ar;
  String? original_price_text_en;
  int? shipping_price_from;
  int? shipping_price_to;
  int? shipping_company_city_id;
  ShippingCompanyData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    amount = json['amount'];
    amount_text = json['amount_text'];
    to_price_text = json['to_price_text'];
    original_price_text_ar = json['original_price_text_ar'];
    original_price_text_en = json['original_price_text_en'];
    shipping_price_from = json['shipping_price_from'];
    shipping_price_to = json['shipping_price_to'];
    shipping_company_city_id = json['shipping_company_city_id'];
  }
}

class PackageData {
  int? id;
  String? name;
  int? discount;
  String? price;
  bool? free_shipping;
  int? replace_hours;
  PackageData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    discount = json['discount'];
    price = json['price'];
    free_shipping = json['free_shipping'];
    replace_hours = json['replace_hours'];
  }
}

class CouponData {
  int? id;
  String? coupon;
  int? discount;
  String? price;
  String? type;
  String? type_text;
  String? user_famous_price;
  String? replace_hours;
  CouponData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    coupon = json['coupon'];
    discount = json['discount'];
    price = json['price'];
    type = json['type'];
    type_text = json['type_text'];
    user_famous_price = json['user_famous_price'];
    replace_hours = json['replace_hours'];
  }
}
