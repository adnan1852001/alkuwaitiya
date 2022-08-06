class ShopSettingsCuntriesModel {
  bool? status;
  int? code;
  String? message;
  CuntriesData? data;
  ShopSettingsCuntriesModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? CuntriesData.fromjson(json['data']) : null;
  }
}

class CuntriesData {
  int? id;
  String? name;
  String? country_code;
  String? phone_code;
  String? flag;
  CuntriesData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country_code = json['country_code'];
    phone_code = json['phone_code'];
    flag = json['flag'];
  }
}
