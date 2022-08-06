// ignore_for_file: must_be_immutable

import 'package:alkuwaitiya_stor/android/app/src/main/java/shared/components/componts/components.dart';
import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/modules/forgotpass_screen/forgotpass_screen.dart';
import 'package:alkuwaitiya_stor/modules/home_screen/home_screen.dart';
import 'package:alkuwaitiya_stor/modules/register_screen/register_screen.dart';
import 'package:alkuwaitiya_stor/shared/method/navigator/navigator.dart';
import 'package:alkuwaitiya_stor/shared/widgets/bottom_image/bottom_image.dart';
import 'package:alkuwaitiya_stor/shared/widgets/up_image/up_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
      listener: (context, state) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (state is LoginSuccessState) {
          if (state.loginModel.status == true) {
            prefs
                .setString(
                    'token', state.loginModel.data!.access_token as String)
                .then((value) {
              navigatorPushAndRemove(context, const HomeScreen());
            });
          }
        }
      },
      builder: (context, state) => Form(
        key: fromKey,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: const Color(0xffFAFAFA),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    upImage(),
                    const SizedBox(
                      height: 49.3,
                    ),
                    const Text(
                      ' مرحبا بعودتك ',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text(
                      ' تسجيل دخول ',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    const SizedBox(
                      height: 21.7,
                    ),
                    defulteTextFormFeild(
                        controller: emailController,
                        labelText: ' البريد الالكتروني ',
                        icon: Icons.email,
                        onTap: () {},
                        validator: ' الرجاء ادخال البريد الاكتروني ',
                        type: TextInputType.emailAddress),
                    const SizedBox(
                      height: 14.0,
                    ),
                    defulteTextFormFeild(
                        obscureText: true,
                        type: TextInputType.visiblePassword,
                        controller: passwordController,
                        labelText: ' كلمة المرور ',
                        icon: Icons.lock_rounded,
                        onTap: () {},
                        validator: ' الرجاء ادخال كلمة المرور ',
                        onSubmit: (val) {
                          if (fromKey.currentState!.validate()) {
                            ShopCubit.get(context).loginScreen(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        }),
                    const SizedBox(
                      height: 16.6,
                    ),
                    TextButton(
                        onPressed: () {
                          navigatorPush(context, ForgetPasswordScreen());
                        },
                        child: Text(
                          ' هل نسيت كلمة المرور؟ ',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.grey.shade900),
                        )),
                    const SizedBox(
                      height: 67.8,
                    ),
                    defulteButtom(
                      onPressed: () {
                        if (fromKey.currentState!.validate()) {
                          ShopCubit.get(context).loginScreen(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      colorBtn: const Color(0xffED1B35),
                      text: ' تسجيل دخول ',
                    ),
                    const SizedBox(
                      height: 13.0,
                    ),
                    defulteButtom(
                      onPressed: () {
                        navigatorPushAndRemove(context, const HomeScreen());
                      },
                      colorBtn: const Color(0xff000000),
                      text: ' الاستمرار كضيف ',
                    ),
                    const SizedBox(
                      height: 44.0,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          ' ليس لديك حساب؟ ',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        TextButton(
                            onPressed: () {
                              navigatorPush(context, RegisterScreen());
                            },
                            child: const Text(
                              ' تسجيل جديد ',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xffed1b35),
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    bottomImage()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
