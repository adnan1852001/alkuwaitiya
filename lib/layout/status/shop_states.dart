// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:alkuwaitiya_stor/models/forget_pass_model/forget_pass_model.dart';
import 'package:alkuwaitiya_stor/models/home_model/home_model.dart';
import 'package:alkuwaitiya_stor/models/login_model/login_model.dart';
import 'package:alkuwaitiya_stor/models/regester_model/regester_model.dart';

abstract class ShopStatus {}

class ShopInitialStates extends ShopStatus {}

class ShopLoadingState extends ShopStatus {}

class BtnNavigationStates extends ShopStatus {}

class ChangeIconStates extends ShopStatus {}

class ChangeCategoryIndexState extends ShopStatus {}

class setCategoryTextIndexState extends ShopStatus {}

class indexPageStates extends ShopStatus {}

class proDescriptionState extends ShopStatus {}

class changeBtnCardStates extends ShopStatus {}

class changeonTabInPartStates extends ShopStatus {}

class changeCheckboxStates extends ShopStatus {}

class changeSwichStates extends ShopStatus {}

class CounterAddState extends ShopStatus {
  final int counter;

  CounterAddState(this.counter);
}

class CounterMinusState extends ShopStatus {
  final int counter;

  CounterMinusState(this.counter);
}

//*********************************login*******************************//
class LoginLoadingState extends ShopStatus {}

class LoginSuccessState extends ShopStatus {
  final ShopLoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends ShopStatus {
  final String error;

  LoginErrorState(this.error);
}

//**************************   Register   ********************************//
class RegisterLoadingState extends ShopStatus {}

class RegisterSuccessState extends ShopStatus {
  final ShopRegisterModel RegisterModel;
  RegisterSuccessState(this.RegisterModel);
}

class RegisterErrorState extends ShopStatus {
  final String error;

  RegisterErrorState(this.error);
}
//**************************   Home   ********************************//

class HomeLoadingState extends ShopStatus {}

class HomeSuccessState extends ShopStatus {
  final ShopHomeModel HomeModel;

  HomeSuccessState(this.HomeModel);
}

class HomeErrorState extends ShopStatus {
  final String error;

  HomeErrorState(this.error);
}

//**************************   favorites   ********************************//

class CartLoadingState extends ShopStatus {}

class CartSuccessState extends ShopStatus {
  final ShopHomeModelCartModel;

  CartSuccessState(this.ShopHomeModelCartModel);
}

class CartErrorState extends ShopStatus {
  final String error;

  CartErrorState(this.error);
}

//*********************************  ForgetPass  *******************************//
class ForgetPassLoadingState extends ShopStatus {}

class ForgetPassSuccessState extends ShopStatus {
  final ShopForgetPassModel ForgetPassModel;

  ForgetPassSuccessState(this.ForgetPassModel);
}

class ForgetPassErrorState extends ShopStatus {
  final String error;

  ForgetPassErrorState(this.error);
}

//*********************************  subCategoryScreen  *******************************//
class SubCategoryLoadingState extends ShopStatus {}

class SubCategorySuccessState extends ShopStatus {}

class SubCategoryErrorState extends ShopStatus {
  final String error;

  SubCategoryErrorState(this.error);
}

//*********************************  AddFavoritScreen  *******************************//
class AddFavoritLoadingState extends ShopStatus {}

class AddFavoritSuccessState extends ShopStatus {}

class AddFavoritErrorState extends ShopStatus {
  final String error;

  AddFavoritErrorState(this.error);
}

//*********************************  RemoveFavoritScreen  *******************************//
class RemoveFavoritLoadingState extends ShopStatus {}

class RemoveFavoritSuccessState extends ShopStatus {}

class RemoveFavoritErrorState extends ShopStatus {
  final String error;

  RemoveFavoritErrorState(this.error);
}

//*********************************  getCategoryScreen  *******************************//
class FavoritLoadingState extends ShopStatus {}

class FavoritSuccessState extends ShopStatus {}

class FavoritErrorState extends ShopStatus {
  final String error;

  FavoritErrorState(this.error);
}

//*********************************  post rateScreen  *******************************//
class RatesLoadingState extends ShopStatus {}

class RatesSuccessState extends ShopStatus {}

class RatesErrorState extends ShopStatus {
  final String error;

  RatesErrorState(this.error);
}

//*********************************  getHelpCenterScreen  *******************************//
class HelpCenterLoadingState extends ShopStatus {}

class HelpCenterSuccessState extends ShopStatus {}

class HelpCenterErrorState extends ShopStatus {
  final String error;

  HelpCenterErrorState(this.error);
}

//*********************************  getCategoryScreen  *******************************//
class ChangeNavigationLoadingState extends ShopStatus {}

class ChangeNavigationSuccessState extends ShopStatus {}

class ChangeNavigationErrorState extends ShopStatus {
  final String error;

  ChangeNavigationErrorState(this.error);
}

//*********************************  UpdateProfileScreen  *******************************//
class UpdateProfileLoadingState extends ShopStatus {}

class UpdateProfileSuccessState extends ShopStatus {}

class UpdateProfileErrorState extends ShopStatus {
  final String error;

  UpdateProfileErrorState(this.error);
}

//*********************************  UpdateProfileScreen  *******************************//
class GetUpdateProfileLoadingState extends ShopStatus {}

class GetUpdateProfileSuccessState extends ShopStatus {}

class GetUpdateProfileErrorState extends ShopStatus {
  final String error;

  GetUpdateProfileErrorState(this.error);
}

//*********************************  logoutScreen  *******************************//
class logoutLoadingState extends ShopStatus {}

class logoutSuccessState extends ShopStatus {}

class logoutErrorState extends ShopStatus {
  final String error;

  logoutErrorState(this.error);
}

//*********************************  produceCartScreen  *******************************//
class ProduceCartLoadingState extends ShopStatus {}

class ProduceCartSuccessState extends ShopStatus {}

class ProduceCartErrorState extends ShopStatus {
  final String error;

  ProduceCartErrorState(this.error);
}

//*********************************  ReceivingMethodScreen  *******************************//
class ReceivingMethodLoadingState extends ShopStatus {}

class ReceivingMethodSuccessState extends ShopStatus {}

class ReceivingMethodErrorState extends ShopStatus {
  final String error;

  ReceivingMethodErrorState(this.error);
}
