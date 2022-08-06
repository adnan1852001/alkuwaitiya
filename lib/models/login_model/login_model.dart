// ignore_for_file: non_constant_identifier_names

class ShopLoginModel {
  bool? status;
  int? code;
  String? message;
  UserData? data;
  String? url;
  ShopLoginModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromjson(json['data']) : null;
    url = json['url'];
  }
}

class UserData {
  dynamic? user_id;
  // String? first_name;
  // String? last_name;
  // String? user_avatar;
  // String? user_email;
  // String? mobile;
  // String? platform;
  // String? user_role;
  String? access_token;
  // late int points_count;
  // late int points_price;
  // late int cart_product_count;
  // late int count_quantity;
  // UserShippingInfo? shipping_info;
  // String? package;
  // UserCountry? country;
  // bool? notification;

  UserData.fromjson(Map<String, dynamic> json) {
    user_id = json['user_id'];
    // first_name = json['first_name'];
    // last_name = json['last_name'];
    // user_avatar = json['user_avatar'];
    // user_email = json['user_email'];
    // mobile = json['mobile'];
    // platform = json['platform'];
    // user_role = json['user_role'];
    access_token = json['access_token'];
    // points_count = json['points_count'];
    // points_price = json['points_price'];
    // cart_product_count = json['cart_product_count'];
    // count_quantity = json['count_quantity'];
    // // shipping_info  = UserShippingInfo.fromjson(json['user_id']);
    // shipping_info = json['shipping_info'] != null
    //     ? UserShippingInfo.fromjson(json['shipping_info'])
    //     : null;
    // package = json['package'];
    // // country  = UserCountry.fromjson(json['user_id']);
    // country =
    //     json['country'] != null ? UserCountry.fromjson(json['country']) : null;
    // notification = json['notification'];
  }
}

// class UserShippingInfo {
//   int? id;
//   String? first_name;
//   String? last_name;
//   String? phone;
//   UserCountry? country;
//   String? city;
//   String? city2;
//   String? state;
//   String? street;
//   String? avenue;
//   String? building_number;
//   String? floor_number;
//   String? apartment_number;
//   String? address_1;
//   String? email;
//   String? billing_shipping_type;
//   String? billing_national_address;
//   String? billing_building_number;
//   String? billing_postalcode_number;
//   String? billing_unit_number;
//   String? billing_extra_number;
//   String? platform;
//   String? delivared_name;
//   bool? is_default;
//   bool? is_verified;
//   String? code;
//
//   UserShippingInfo.fromjson(Map<String, dynamic> json) {
//     id = json['id'];
//     first_name = json['first_name'];
//     last_name = json['last_name'];
//     phone = json['phone'];
//     country =
//         json['country'] != null ? UserCountry.fromjson(json['country']) : null;
//     city = json['city'];
//     city2 = json['city2'];
//     state = json['state'];
//     street = json['street'];
//     avenue = json['avenue'];
//     building_number = json['building_number'];
//     floor_number = json['floor_number'];
//     apartment_number = json['apartment_number'];
//     address_1 = json['address_1'];
//     email = json['email'];
//     billing_shipping_type = json['billing_shipping_type'];
//     billing_national_address = json['billing_national_address'];
//     billing_building_number = json['billing_building_number'];
//     billing_postalcode_number = json['billing_postalcode_number'];
//     billing_unit_number = json['billing_unit_number'];
//     billing_extra_number = json['billing_extra_number'];
//     platform = json['platform'];
//     delivared_name = json['delivared_name'];
//     is_default = json['is_default'];
//     is_verified = json['is_verified'];
//     code = json['code'];
//   }
// }
//
// class UserCountry {
//   int? id;
//   String? name;
//   String? country_code;
//   String? phone_code;
//   String? flag;
//
//   UserCountry.fromjson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     country_code = json['country_code'];
//     phone_code = json['phone_code'];
//     flag = json['flag'];
//   }
// }
