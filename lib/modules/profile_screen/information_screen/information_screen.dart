// ignore_for_file: must_be_immutable

import 'package:alkuwaitiya_stor/android/app/src/main/java/shared/components/componts/components.dart';
import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/shared/method/navigator/navigator.dart';
import 'package:alkuwaitiya_stor/shared/method/refresh/refresh.dart';
import 'package:alkuwaitiya_stor/shared/widgets/app_bar/app_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InformationScreen extends StatelessWidget {
  InformationScreen({Key? key}) : super(key: key);
  var firstNameController = TextEditingController();
  var secondNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);

          var data = ShopCubit.get(context).getUpdateProfile!.data;
          firstNameController.text = data!.first_name!;
          secondNameController.text = data.last_name!;
          phoneController.text = data.mobile!;
          emailController.text = data.user_email!;

          return ConditionalBuilder(
            condition: ShopCubit.get(context).loginModel == null,
            fallback: (context) => const Center(
              child: CircularProgressIndicator(
                color: Color(0xffED1B35),
                strokeWidth: 2,
                backgroundColor: Colors.grey,
              ),
            ),
            builder: (context) => Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                backgroundColor: const Color(0xffFAFAFA),
                appBar: AppBar(
                  backgroundColor: const Color(0xffED1B35),
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light,
                    statusBarColor: Color(0xffED1B35),
                  ),
                  title: appBarText(title: 'معلوماتي'),
                ),
                body: RefreshIndicator(
                  onRefresh: refresh,
                  backgroundColor: Colors.grey.shade200,
                  color: Color(0xffED1B35),
                  displacement: 10,
                  triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  edgeOffset: 20,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: fromKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // data.user_avatar == null
                                //     ? const Image(
                                //         image: AssetImage(
                                //           "images/Layer 44.png",
                                //         ),
                                //         width: 111.99,
                                //         height: 112.23,
                                //       )
                                //     :
                                CircleAvatar(
                                  backgroundColor: Color(0xffFAFAFA),
                                  radius: 55.5,
                                  backgroundImage: NetworkImage(
                                    data.user_avatar!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20.77,
                          ),
                          defulteTextFormFeild(
                            controller: firstNameController,
                            icon: Icons.person,
                            labelText: ' الاسم الاول ',
                            validator: ' !الاسم الاول ',
                          ),
                          const SizedBox(
                            height: 9.0,
                          ),
                          defulteTextFormFeild(
                            controller: secondNameController,
                            icon: Icons.person,
                            labelText: ' الاسم الثاني ',
                            validator: ' !الاسم الثاني ',
                          ),
                          const SizedBox(
                            height: 9.0,
                          ),
                          defulteTextFormFeild(
                            controller: phoneController,
                            icon: Icons.phone_android,
                            labelText: ' رقم الموبايل ',
                            validator: ' !رقم الموبايل ',
                          ),
                          const SizedBox(
                            height: 9.0,
                          ),
                          defulteTextFormFeild(
                            controller: emailController,
                            icon: Icons.email,
                            labelText: ' البريد الالكتروني ',
                            validator: ' !البريد الالكتروني ',
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            ' تعديل كلمة المرور',
                            style: TextStyle(
                                fontSize: 12.0, color: Color(0xff696969)),
                          ),
                          const SizedBox(
                            height: 9.0,
                          ),
                          defulteTextFormFeild(
                            controller: oldPasswordController,
                            icon: Icons.lock,
                            labelText: ' كلمة المرور ',
                          ),
                          const SizedBox(
                            height: 9.0,
                          ),
                          defulteTextFormFeild(
                            controller: newPasswordController,
                            icon: Icons.lock,
                            labelText: ' كلمة المرورالجديدة ',
                          ),
                          const SizedBox(
                            height: 9.0,
                          ),
                          defulteTextFormFeild(
                            controller: rePasswordController,
                            icon: Icons.lock,
                            labelText: ' تأكيد كلمة المرورالجديدة ',
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          defulteButtom(
                              onPressed: () {
                                if (fromKey.currentState!.validate()) {
                                  if (newPasswordController.text ==
                                      rePasswordController.text) {
                                    cubit.updateProfileScreen(
                                      first_name: firstNameController.text,
                                      last_name: secondNameController.text,
                                      phone: phoneController.text,
                                      email: emailController.text,
                                      old_password: oldPasswordController.text,
                                      password: newPasswordController.text,
                                    );

                                    navigatorPushAndRemove(
                                        context, InformationScreen());
                                  }
                                }
                              },
                              colorBtn: const Color(0xffED1B35),
                              text: ' حفظ التغيرات ')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
