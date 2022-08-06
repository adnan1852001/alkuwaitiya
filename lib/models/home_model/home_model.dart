// ignore_for_file: unnecessary_question_mark, non_constant_identifier_names

class ShopHomeModel {
  bool? status;
  dynamic? code;
  String? message;
  HomeData? data;
  ShopHomeModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? HomeData.fromjson(json['data']) : null;
  }
}

class HomeData {
  List<MainData>? main_slider = [];
  List<CategoryData>? category_slider = [];
  List<BrandsData>? brands_slider = [];

  HomeData.fromjson(Map<String, dynamic> json) {
    json['main_slider']
        .forEach((element) => main_slider!.add(MainData.fromjson(element)));

    json['category_slider'].forEach(
        (element) => category_slider!.add(CategoryData.fromjson(element)));

    json['brands_slider']
        .forEach((element) => brands_slider!.add(BrandsData.fromjson(element)));
  }
}

/////////*************************************/
class MainData {
  dynamic? id;
  String? name;
  String? name_ar;
  String? name_en;
  dynamic? parent;
  String? image;
  String? image_ar;
  String? image_en;
  String? image_website;
  String? image_website_ar;
  String? image_website_en;
  int? type;
  String? type_text;
  bool? have_children;

  MainData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    name_ar = json['name_ar'];
    name_en = json['name_en'];
    parent = json['parent'];
    image = json['image'];
    image_ar = json['image_ar'];
    image_en = json['image_en'];
    image_website = json['image_website'];
    image_website_ar = json['image_website_ar'];
    image_website_en = json['image_website_en'];
    type = json['type'];
    type_text = json['type_text'];
    have_children = json['have_children'];
  }
}

//**************************************************************//
class CategoryData {
  dynamic? type;
  dynamic? order;
  DataCategoryData? data;
  CategoryData.fromjson(Map<String, dynamic> json) {
    type = json['type'];
    order = json['order'];
    // data    =DataCategoryData.fromjson(json['data']);
    data =
        json['data'] != null ? DataCategoryData.fromjson(json['data']) : null;
  }
}

class DataCategoryData {
  dynamic? id;
  String? name;
  String? name_ar;
  String? name_en;
  String? image;
  dynamic? banner_type;
  List<ProductsData>? products = [];

  DataCategoryData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    name_ar = json['name_ar'];
    name_en = json['name_en'];
    image = json['image'];
    banner_type = json['banner_type'];
    json['products']
        .forEach((element) => products!.add(ProductsData.fromjson(element)));
  }
}

class ProductsData {
  dynamic? id;
  dynamic? product_id;
  String? name;
  String? name_ar;
  String? name_en;
  String? image;
  String? image_ar;
  String? image_en;
  String? image_website;
  String? image_website_ar;
  String? image_website_en;
  dynamic? type;
  String? type_text;
  bool? is_new;
  bool? in_favorite;
  String? price_after;
  String? price;
  String? currency;
  String? currency_en;
  String? currency_ar;
  String? thumb_image;
  String? description;
  String? description_ar;
  String? description_en;
  bool? is_discount;
  String? discount_rate;
  bool? in_cart;
  bool? in_stock;
  bool? in_offer;
  bool? is_variation;
  dynamic? rate_sum;
  dynamic? rate;
  String? brand_name;
  String? brand_name_ar;
  String? brand_name_en;
  String? categories;
  dynamic? price_tax_in_products;
  String? note_discount_product_details;
  dynamic? min_quantity;
  dynamic? max_quantity;
  bool? has_admin_discount;

  ProductsData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    name_ar = json['name_ar'];
    name_en = json['name_en'];
    image = json['image'];
    image_ar = json['image_ar'];
    image_en = json['image_en'];
    image_website = json['image_website'];
    image_website_ar = json['image_website_ar'];
    image_website_en = json['image_website_en'];
    type = json['type'];
    type_text = json['type_text'];
    is_new = json['is_new'];
    in_favorite = json['in_favorite'];
    price_after = json['price_after'];
    price = json['price'];

    thumb_image = json['thumb_image'];
    description_ar = json['description_ar'];
    description_en = json['description_en'];
    currency = json['currency'];
    currency_en = json['currency_en'];
    currency_ar = json['currency_ar'];
    discount_rate = json['discount_rate'];
    is_discount = json['is_discount'];
    in_cart = json['in_cart'];
    in_stock = json['in_stock'];
    in_offer = json['in_offer'];
    rate_sum = json['rate_sum'];
    rate = json['rate'];
    brand_name = json['brand_name'];
    brand_name_ar = json['brand_name_ar'];
    brand_name_en = json['brand_name_en'];
    categories = json['categories'];
    price_tax_in_products = json['price_tax_in_products'];
    min_quantity = json['min_quantity'];
    max_quantity = json['max_quantity'];
    has_admin_discount = json['has_admin_discount'];
  }
}

class BrandsData {
  dynamic? id;
  String? title;
  String? slug;
  String? description;
  dynamic? product_count;
  String? image;
  BrandsData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    product_count = json['product_count'];
    image = json['image'];
  }
}
