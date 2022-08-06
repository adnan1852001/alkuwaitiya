// ignore_for_file: non_constant_identifier_names

import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/shared/widgets/app_bar/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationSettingsScreen extends StatelessWidget {
  const ApplicationSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          bool value = false;
          var cubit = ShopCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: const Color(0xffFAFAFA),
              appBar: AppBar(
                backgroundColor: const Color(0xffED1B35),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: Color(0xffED1B35),
                ),
                title: appBarText(title: 'إعدادات التطبيق'),
              ),
              body: Column(
                children: [
                  Paadding(
                    context,
                    text: 'الإشعارات',
                    textImage: 'notification-bell.png',
                    widget: CupertinoSwitch(
                      value: cubit.Switch,
                      onChanged: (val) {
                        cubit.changeNavigationScreen();

                        cubit.changeSwitch(
                            cubit.notificationModel!.notification);
                      },
                      activeColor: const Color(0xffF9E8E9),
                      thumbColor: Colors.black,
                      trackColor: const Color(0xffF8F8F8),
                    ),
                  ),
                  Paadding(context,
                      widget: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 50.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.grey.shade200,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                'images/Vector Smart Object.png',
                                width: 22.0,
                                height: 22.0,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                size: 18.0,
                              )
                            ],
                          ),
                        ),
                      ),
                      text: 'الدولة',
                      textImage: 'australia.png'),
                  Paadding(context,
                      widget: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 50.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.grey.shade200,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'د.ك',
                                style: TextStyle(
                                    fontSize: 13.0, color: Color(0xffED1B35)),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 18.0,
                              )
                            ],
                          ),
                        ),
                      ),
                      text: 'العملة',
                      textImage: 'exchange.png')
                ],
              ),
            ),
          );
        });
  }

  Widget Paadding(
    context, {
    required Widget widget,
    required String text,
    required String textImage,
  }) =>
      Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
        child: Container(
          height: 48.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image(
                  image: AssetImage(
                    "images/$textImage",
                  ),
                  width: 26.0,
                  height: 26.0,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                widget,
              ],
            ),
          ),
        ),
      );
}
