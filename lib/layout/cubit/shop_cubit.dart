// ignore_for_file: avoid_print, non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/models/cart_model/cart_model.dart';
import 'package:alkuwaitiya_stor/models/category_model/category_model.dart';
import 'package:alkuwaitiya_stor/models/favorite_model/favorite_model.dart';
import 'package:alkuwaitiya_stor/models/forget_pass_model/forget_pass_model.dart';
import 'package:alkuwaitiya_stor/models/help_center_model/help_center_model.dart';
import 'package:alkuwaitiya_stor/models/home_model/home_model.dart';
import 'package:alkuwaitiya_stor/models/login_model/login_model.dart';
import 'package:alkuwaitiya_stor/models/notification_model/notification_model.dart';
import 'package:alkuwaitiya_stor/models/receiving_method_model/receiving_method_model.dart';
import 'package:alkuwaitiya_stor/models/regester_model/regester_model.dart';
import 'package:alkuwaitiya_stor/models/settings_cuntries_model/settings_cuntries_model.dart';
import 'package:alkuwaitiya_stor/models/update_profile/update_profile.dart';
import 'package:alkuwaitiya_stor/modules/%20parts_screen/parts_screen.dart';
import 'package:alkuwaitiya_stor/modules/%20prand_screen/prand_screen.dart';
import 'package:alkuwaitiya_stor/modules/boxshop_screen/boxshop_screen.dart';
import 'package:alkuwaitiya_stor/modules/main_screen/main_screen.dart';
import 'package:alkuwaitiya_stor/modules/profile_screen/profile_screen.dart';
import 'package:alkuwaitiya_stor/shared/method/snack_bar/snack_bar.dart';
import 'package:alkuwaitiya_stor/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopCubit extends Cubit<ShopStatus> {
  ShopCubit() : super(ShopInitialStates());

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  ShopLoginModel? loginModel;
  ShopRegisterModel? RegisterModel;
  ShopHomeModel? HomeModel;
  ShopCartModel? CartModel;
  ShopHelpCenterModel? HelpCenterModel;
  ShopForgetPassModel? ForgetPassModel;
  ShopSettingsCuntriesModel? SettingsCuntriesModel;
  ShopCategoryModel? CategoryModel;
  ShopCategoryModel? CategoryModel2;
  ShopFavoriteModel? favoriteModel;
  ShopFavoriteModel? favoriteModel2;
  ShopNotificationModel? notificationModel;
  // ShopLoginModel? updateProfile;
  ShopUpdateProfile? getUpdateProfile;
  ShopReceivingMethodModel? receivingMethodModel;
  int activeindex = 1;

  Map<dynamic, dynamic> favorite = {};
  String text1 = '';
  int categoryIndex = 0;

  void setCategoryIndex(int index) {
    categoryIndex = index;
    emit(ChangeCategoryIndexState());
  }

  int categoryTextIndex = 0;

  void setCategoryTextIndex(int index) {
    categoryTextIndex = index;
    emit(setCategoryTextIndexState());
  }

  void indexPage(int index) {
    activeindex = index;
    emit(indexPageStates());
  }

  void changeBtn(int index) {
    currentIndex = index;
    emit(BtnNavigationStates());
  }

  List<Widget> Screens = [
    MainScreen(),
    PartsScreen(),
    const PrandScreen(),
    const BoxShopScreen(),
    const ProfileScreen(),
  ];

  bool productDescription = false;

  void proDescription(bool newProductDescription) {
    if (productDescription == false) {
      newProductDescription = true;
    } else {
      newProductDescription = false;
    }
    productDescription = newProductDescription;
    print(productDescription);
    emit(proDescriptionState());
  }

  bool Change = false;

  void onTabInPart(bool onChange) {
    if (Change == false) {
      onChange = true;
    } else {
      onChange = false;
    }
    Change = onChange;
    print(Change);
    emit(changeonTabInPartStates());
  }

  bool checkBox = false;

  void changeCheckbox(bool newCheckbox) {
    if (checkBox == false) {
      newCheckbox = true;
    } else {
      newCheckbox = false;
    }
    checkBox = newCheckbox;
    emit(changeCheckboxStates());
  }

  bool Switch = true;
  void changeSwitch(newChange) {
    Switch = newChange;
    emit(changeSwichStates());
  }

  //**************************************************** get log out  **********************************************************************/
  void logOutScreen(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    emit(logoutLoadingState());
    DioHelper.getData(
      url: 'user/logout',
      token: 'Bearer $token',
    ).then((value) {
      snackBar(context, value.data['message']);
      print(value.data['message']);

      emit(logoutSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(logoutErrorState(error.toString()));
    });
  }

  //**************************************************** post Loing  **********************************************************************/
  void loginScreen({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postdata(url: 'user/login', data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginModel = ShopLoginModel.fromjson(value.data);
      print(loginModel!.message);
      print(loginModel!.data!.access_token);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  //****************************************************  post Register  ***********************************************//
  void RegisterScreen({
    required String email,
    required String phone,
    required String password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postdata(url: 'user/register', data: {
      'email': email,
      'phone': phone,
      'password': password,
      'platform': 'ios'
    }).then((value) {
      RegisterModel = ShopRegisterModel.fromjson(value.data);
      emit(RegisterSuccessState(RegisterModel!));
      print(RegisterModel!.message);
    }).catchError((error) {
      print(error);
      emit(RegisterErrorState(error.toString()));
    });
  }

//****************************************************  post HOME   ***********************************************//

  void HomeScreen() {
    emit(HomeLoadingState());
    DioHelper.getData(
      url: 'home',
    ).then((value) {
      HomeModel = ShopHomeModel.fromjson(value.data);
      print(HomeModel!.data);
      // HomeModel!.data!.category_slider![1].data!.products!.forEach((element) {
      //   print(element.in_favorite);
      //   favorite.addAll({
      //     element.id: element.in_favorite,
      //   });
      // });
      // print(favorite.toString());

      emit(HomeSuccessState(HomeModel!));
    }).catchError((error) {
      print(error.toString());
      print('error');
      emit(HomeErrorState(error.toString()));
    });
  }

//****************************************************    get HelpCenter   ***********************************************//

  void HelpCenterScrren() {
    emit(HelpCenterLoadingState());
    DioHelper.getData(
      url: 'user/help_center',
    ).then((value) {
      HelpCenterModel = ShopHelpCenterModel.fromjson(value.data);
      print(HelpCenterModel!.message);
      emit(HelpCenterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HelpCenterErrorState(error.toString()));
    });
  }

//****************************************************  post ForgetPass   ***********************************************//
  void ForgetPass({
    required String email,
  }) {
    emit(ForgetPassLoadingState());
    DioHelper.postdata(url: 'user/forgot-password', data: {
      'email': email,
    }).then((value) {
      ForgetPassModel = ShopForgetPassModel.fromjson(value.data);
      print(ForgetPassModel!.status);
      emit(ForgetPassSuccessState(ForgetPassModel!));
    }).catchError((erorr) {
      print(erorr.toString());
      emit(ForgetPassErrorState(erorr.toString()));
    });
  }

  //****************************************************    get Settings Cuntries    ***********************************************//

  void setingsCuntriesScrren() {
    DioHelper.getData(
      url: 'user/countries',
    ).then((value) {
      SettingsCuntriesModel = ShopSettingsCuntriesModel.fromjson(value.data);
      print(SettingsCuntriesModel!.message);
    }).catchError((error) {
      print(error.toString());
    });
  }

  //****************************************************    get Category   ***********************************************//

  void categoryScreen() {
    DioHelper.getData(
      url: 'category',
    ).then((value) {
      CategoryModel = ShopCategoryModel.fromjson(value.data);
      print(CategoryModel!.data![1].image);
    }).catchError((error) {
      print(error.toString());
    });
  }

  //****************************************************    get SubCategory   ***********************************************//
  void subCategoryScreen(int id) {
    emit(SubCategoryLoadingState());
    DioHelper.getData(
      url: 'category/$id',
    ).then((value) {
      emit(SubCategorySuccessState());
      CategoryModel2 = ShopCategoryModel.fromjson(value.data);
      print(CategoryModel2!.data![1].image);
    }).catchError((error) {
      emit(SubCategoryErrorState(error.toString()));
      print(error.toString());
    });
  }

  //****************************************************    post add favorite   ***********************************************//
  void addFavoriteScreen(context, int id) async {
    favorite[id] = !favorite[id];
    emit(AddFavoritSuccessState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    DioHelper.getData(
            url: 'user/add-product-to-favorite/$id', token: 'Bearer $token')
        .then((value) {
      snackBar(context, value.data['message']);
      emit(AddFavoritSuccessState());
    }).catchError((error) {
      favorite[id] = !favorite[id];
      emit(AddFavoritErrorState(error.toString()));
      snackBar(context, 'المنتج بالفعل موجود في المفضلة');
    });
  }

  //****************************************************    post Remove favorite   ***********************************************//
  void removeFavoriteScreen(context, int id) async {
    emit(RemoveFavoritLoadingState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    DioHelper.getData(
            url: 'user/remove-product-from-favorite/$id',
            token: 'Bearer $token')
        .then((value) {
      snackBar(context, value.data['message']);
      emit(RemoveFavoritSuccessState());
    }).catchError((error) {
      snackBar(context, 'المنتج غير موجود في المفضلة');
      emit(RemoveFavoritErrorState(error.toString()));
    });
  }

  //****************************************************    get favorite   ***********************************************//
  void getFavoriteScreen() async {
    emit(FavoritLoadingState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    DioHelper.getData(url: 'user/favorites', token: 'Bearer $token')
        .then((value) {
      favoriteModel = ShopFavoriteModel.fromjson(value.data);
      print(favoriteModel!.message);
      emit(FavoritSuccessState());
    }).catchError((error) async {
      emit(FavoritErrorState(error.toString()));
    });
  }

//****************************************************    Change Navigation   ***********************************************//
  void changeNavigationScreen() async {
    emit(ChangeNavigationLoadingState());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    DioHelper.getData(
            url: 'user/change-notification-status', token: 'Bearer $token')
        .then((value) {
      notificationModel = ShopNotificationModel.fromjson(value.data);
      print(notificationModel!.message);
      emit(ChangeNavigationSuccessState());
    }).catchError((error) {
      emit(ChangeNavigationErrorState(error.toString()));
    });
  }

  //****************************************************    post update profile  ***********************************************//
  void updateProfileScreen({
    required String first_name,
    required String last_name,
    required String phone,
    required String email,
    String? old_password,
    String? password,
  }) async {
    emit(UpdateProfileLoadingState());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    DioHelper.postdata(
            url: 'user/update',
            data: {
              'first_name': first_name,
              'last_name': last_name,
              'phone': phone,
              'email': email,
              'old_password': old_password,
              'password': password,
            },
            token: 'Bearer $token')
        .then((value) {
      // updateProfile = ShopLoginModel.fromjson(value.data);
      // print(updateProfile!.data!.user_email);
      emit(UpdateProfileSuccessState());
    }).catchError((error) {
      emit(UpdateProfileErrorState(error.toString()));
      print(error.toString());
    });
  }

//****************************************************    get update profile  ***********************************************//
  void getUpDateProfile() async {
    emit(GetUpdateProfileLoadingState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    DioHelper.getData(
      url: 'user/profile',
      token: 'Bearer $token',
    ).then((value) {
      getUpdateProfile = ShopUpdateProfile.fromjson(value.data);
      print('ststststst');
      print(value.data);
      print(getUpdateProfile!.data!.user_email);
      emit(GetUpdateProfileSuccessState());
    }).catchError((erorr) {
      print(erorr.toString());
      print('erorrorprr');
      emit(GetUpdateProfileErrorState(erorr.toString()));
    });
  }

  //****************************************************    get produceCart profile  ***********************************************//
  void produceCartScreen() async {
    emit(ProduceCartLoadingState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    DioHelper.getData(
      url: 'user/products-cart',
      token: 'Bearer $token',
    ).then((value) {
      emit(ProduceCartSuccessState());
      print('ShopCartModelScss');
      CartModel = ShopCartModel.fromjson(value.data);
      print(CartModel!.data!.price);
    }).catchError((erorr) {
      emit(ProduceCartErrorState(erorr.toString()));
      print(erorr.toString());
      print('ShopCartModelErorr');
    });
  }

  //****************************************************    get ReceivingMethod profile  ***********************************************//
  void receivingMethodScreen() async {
    emit(ReceivingMethodLoadingState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    DioHelper.getData(
      url: 'shipping-companies',
      token: 'Bearer $token',
    ).then((value) {
      emit(ReceivingMethodSuccessState());
      print('ReceivingMethodScss');
      receivingMethodModel = ShopReceivingMethodModel.fromjson(value.data);
      print(receivingMethodModel!.data![0].image);
    }).catchError((erorr) {
      emit(ReceivingMethodErrorState(erorr.toString()));
      print(erorr.toString());
      print('ReceivingMethodErorr');
    });
  }
}
