class ShopNotificationModel {
  late bool status;
  late int code;
  late String message;
  late bool notification;
  ShopNotificationModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    notification = json['notification'];
  }
}
