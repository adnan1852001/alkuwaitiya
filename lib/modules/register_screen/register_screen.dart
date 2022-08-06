// ignore_for_file: must_be_immutable, avoid_print

import 'package:alkuwaitiya_stor/android/app/src/main/java/shared/components/componts/components.dart';
import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/modules/login_screen/login_screen.dart';
import 'package:alkuwaitiya_stor/modules/register_screen/privacy_policy_screen.dart';
import 'package:alkuwaitiya_stor/modules/register_screen/replacement_policy_screen.dart.dart';
import 'package:alkuwaitiya_stor/shared/method/navigator/navigator.dart';
import 'package:alkuwaitiya_stor/shared/method/snack_bar/snack_bar.dart';
import 'package:alkuwaitiya_stor/shared/widgets/bottom_image/bottom_image.dart';
import 'package:alkuwaitiya_stor/shared/widgets/up_image/up_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(listener: (context, state) {
      if (passwordController.text == rePasswordController.text) {
        if (state is RegisterSuccessState) {
          if (state.RegisterModel.status == true) {
            snackBar(context, '${state.RegisterModel.message}');

            if (state.RegisterModel.status == true) {
              if (true) {
                navigatorPushAndRemove(context, LoginScreen());
              }
            }
          }
        }
      }
    }, builder: (context, state) {
      var cubit = ShopCubit.get(context);
      return Form(
        key: fromKey,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: const Color(0xffFAFAFA),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  upImage(),
                  const SizedBox(
                    height: 29.3,
                  ),
                  const Text(
                    ' مستخدم جديد ',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Text(
                    ' التسجيل ',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xff545454),
                    ),
                  ),
                  const SizedBox(
                    height: 18.7,
                  ),
                  defulteTextFormFeild(
                    onTap: () {},
                    controller: emailController,
                    icon: Icons.email,
                    labelText: ' البريد الالكتروني ',
                    validator: ' البريد الالكتروني! ',
                    type: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  defulteTextFormFeild(
                    onTap: () {},
                    controller: phoneController,
                    icon: Icons.phone_android,
                    labelText: ' رقم الموبايل ',
                    validator: ' رقم الموبايل! ',
                    type: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  defulteTextFormFeild(
                    onTap: () {},
                    controller: passwordController,
                    icon: Icons.lock,
                    labelText: ' كلمة المرور ',
                    validator: ' كلمة المرور! ',
                    type: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  defulteTextFormFeild(
                    onTap: () {},
                    controller: rePasswordController,
                    icon: Icons.lock,
                    labelText: ' تأكيد كلمة المرور ',
                    validator: ' تأكيد كلمة المرور! ',
                    type: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 12.2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: cubit.checkBox,
                        onChanged: (val) {
                          cubit.changeCheckbox(true);
                        },
                        checkColor: Colors.white,
                        activeColor: Colors.black87,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0))), // Rounded Checkbox ,
                      ),
                      Text(
                        'أوافق علي',
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 11.0),
                      ),
                      InkWell(
                        onTap: () {
                          navigatorPush(context, const PrivacyPolicyScreen());
                        },
                        child: const Text(
                          'شروط الاستخدام',
                          style: TextStyle(
                              color: Color(0xffED1B35), fontSize: 11.0),
                        ),
                      ),
                      Text(
                        'و',
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 11.0),
                      ),
                      InkWell(
                        onTap: () {
                          navigatorPush(
                              context, const ReplacementPolicyScreen());
                        },
                        child: const Text(
                          'سياسة الاستخدام',
                          style: TextStyle(
                              color: Color(0xffED1B35), fontSize: 11.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 26.82,
                  ),
                  defulteButtom(
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {
                        if (passwordController.text ==
                            rePasswordController.text) {
                          if (cubit.checkBox == true) {
                            cubit.RegisterScreen(
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                            );
                          } else {
                            snackBar(context,
                                ' يجب الموافقة علي شروط وسياسة الاستخدام ');
                          }
                        } else {
                          snackBar(context, ' كلمة السر غير متطابقة ');
                        }
                      }
                    },
                    colorBtn: const Color(0xffED1B35),
                    text: ' تسجيل ',
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' لديك حساب حالي؟ ',
                        style: TextStyle(
                            fontSize: 16.0, color: Colors.grey.shade700),
                      ),
                      TextButton(
                        onPressed: () {
                          navigatorPushAndRemove(context, LoginScreen());
                        },
                        child: const Text(
                          ' تسجيل دخول ',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xffED1B35),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  bottomImage(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
