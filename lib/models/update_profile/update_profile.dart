// ignore_for_file: non_constant_identifier_names

class ShopUpdateProfile {
  bool? status;
  int? code;
  String? message;
  ShopUpdateData? data;
  ShopUpdateProfile.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data =
        (json['data'] != null ? ShopUpdateData.fromjson(json['data']) : null)!;
  }
}

class ShopUpdateData {
  int? user_id;
  String? first_name;
  String? last_name;
  String? user_avatar;
  String? user_email;
  String? mobile;
  String? access_token;
  // String? platform;
  // String? user_role;
  // int? points_count;
  int? points_price;
  // int? cart_product_count;
  // int? count_quantity;
  // bool? notification;
  //  ShippingData shipping_info;
  // late CountryData country;
  ShopUpdateData.fromjson(Map<String, dynamic> json) {
    user_id = json['user_id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    user_avatar = json['user_avatar'];
    user_email = json['user_email'];
    mobile = json['mobile'];
    access_token = json['access_token'];
    // platform = json['platform'];
    // user_role = json['user_role'];
    // points_count = json['points_count'];
    points_price = json['points_price'];
    // cart_product_count = json['cart_product_count'];
    // count_quantity = json['count_quantity'];
    // notification = json['notification'];
    // shipping_info = ShippingData.fromjson(json['data']);
    // country = CountryData.fromjson(json['data']);
  }
}

// class ShippingData {
//   late int id;
//   late String first_name;
//   late String last_name;
//   late String phone;
//   late CountryData country;
//   late String email;
//   late bool is_default;
//   late bool is_verified;
//   late String code;
//   ShippingData.fromjson(Map<String, dynamic> json) {
//     id = json['id'];
//     first_name = json['first_name'];
//     last_name = json['last_name'];
//     phone = json['phone'];
//     country = json['country'];
//     email = json['email'];
//     is_default = json['is_default'];
//     is_verified = json['is_verified'];
//     code = json['code'];
//   }
// }
//
// class CountryData {
//   late int id;
//   late String name;
//   late String country_code;
//   late String phone_code;
//   late String flag;
//   CountryData.fromjson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     country_code = json['country_code'];
//     phone_code = json['phone_code'];
//     flag = json['flag'];
//   }
// }
