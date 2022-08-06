// ignore_for_file: must_be_immutable

import 'package:alkuwaitiya_stor/android/app/src/main/java/shared/components/componts/components.dart';
import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/shared/widgets/bottom_image/bottom_image.dart';
import 'package:alkuwaitiya_stor/shared/widgets/up_image/up_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
      listener: (context, state) {
        if (state is ForgetPassSuccessState) {
          if (state.ForgetPassModel.status == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: const Color(0xffED1B35),
                action: SnackBarAction(
                  label: 'Ok',
                  textColor: Colors.white,
                  onPressed: () {
                    // Code to execute.
                  },
                ),
                content: Text('${state.ForgetPassModel.message}'),
                duration: const Duration(milliseconds: 2000),
                width: 350.0, // Width of the SnackBar.
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, // Inner padding for SnackBar content.
                ),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            );
          }
        }
      },
      builder: (context, state) => Directionality(
        textDirection: TextDirection.rtl,
        child: Form(
          key: fromKey,
          child: Scaffold(
            backgroundColor: const Color(0xffFAFAFA),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  upImage(),
                  const SizedBox(
                    height: 39.3,
                  ),
                  const Text(
                    ' نسيت كلمة المرور ',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Column(
                    children: [
                      Text(
                        ' قم بإضافة بريدك الالكتروني لتصلك رسالة ',
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 12.0),
                      ),
                      Text(
                        ' بكلمة المرور الجديدة ',
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 12.0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 38.7,
                  ),
                  defulteTextFormFeild(
                      onTap: () {},
                      type: TextInputType.emailAddress,
                      controller: emailController,
                      icon: Icons.email,
                      labelText: ' البريد الالكتروني',
                      validator: ' البريد الالكتروني! ',
                      onSubmit: (val) {
                        if (fromKey.currentState!.validate()) {
                          ShopCubit.get(context)
                              .ForgetPass(email: emailController.text);
                        }
                      }),
                  const SizedBox(
                    height: 62.0,
                  ),
                  defulteButtom(
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {
                        ShopCubit.get(context)
                            .ForgetPass(email: emailController.text);
                      }
                    },
                    colorBtn: const Color(0xffED1B35),
                    text: ' اعادة ارسال ',
                  ),
                  const SizedBox(
                    height: 304.0,
                  ),
                  bottomImage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
