class ShopCategoryModel {
  bool? status;
  int? code;
  String? message;
  int? count;
  List<CategoryData>? data = [];
  ShopCategoryModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    count = json['count'];
    json['data']
        .forEach((element) => data!.add(CategoryData.fromjson(element)));
  }
}

class CategoryData {
  int? id;
  String? name;
  int? parent;
  int? parent_app;
  String? image;
  bool? have_children;
  CategoryData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parent = json['parent'];
    parent_app = json['parent_app'];
    image = json['image'];
    have_children = json['have_children'];
  }
}
