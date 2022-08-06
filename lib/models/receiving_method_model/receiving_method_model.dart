// ignore_for_file: non_constant_identifier_names

class ShopReceivingMethodModel {
  bool? status;
  int? code;
  String? message;
  List<ReceivingMethodData>? data = [];

  ShopReceivingMethodModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    json['data']
        .forEach((element) => data!.add(ReceivingMethodData.fromjson(element)));
  }
}

class ReceivingMethodData {
  int? id;
  String? name;
  String? image;
  String? image_web;
  String? note;
  bool? billing_national_address;
  bool? billing_building_number;
  bool? billing_postalcode_number;
  bool? billing_unit_number;
  bool? billing_extra_number;
  bool? accept_user_shipping_address;
  ReceivingMethodData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    image_web = json['image_web'];
    note = json['note'];
  }
}
