class ShopForgetPassModel {
  bool? status;
  String? message;
  ShopForgetPassModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
