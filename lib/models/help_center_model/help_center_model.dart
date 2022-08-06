class ShopHelpCenterModel {
  bool? status;
  int? code;
  String? message;
  HelpCenterData? data;
  ShopHelpCenterModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? HelpCenterData.fromjson(json['data']) : null;
  }
}

class HelpCenterData {
  String? terms;
  String? replacement_policy;
  String? privacy_policy;
  String? about;
  dynamic? tax;
  dynamic? shipping_price;
  String? phone;
  String? email;
  String? facebook;
  String? twitter;
  String? snapchat;
  String? instagram;
  String? youtube;
  String? telegram;

  HelpCenterData.fromjson(Map<String, dynamic> json) {
    terms = json['terms'];
    replacement_policy = json['replacement_policy'];
    privacy_policy = json['privacy_policy'];
    about = json['about'];
    tax = json['tax'];
    shipping_price = json['shipping_price'];
    phone = json['phone'];
    email = json['email'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    snapchat = json['snapchat'];
    instagram = json['instagram'];
    youtube = json['youtube'];
    telegram = json['telegram'];
  }
}
