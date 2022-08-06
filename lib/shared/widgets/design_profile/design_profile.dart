// ignore_for_file: non_constant_identifier_names

import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/modules/login_screen/login_screen.dart';
import 'package:alkuwaitiya_stor/shared/method/navigator/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget DesignProfile(context) {
  var data = ShopCubit.get(context).getUpdateProfile!.data;
  print(data!.user_email);
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          color: Colors.white,
          child: Row(
            children: [
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: const [
                      Image(
                        image: AssetImage(
                          "images/Layer 39.png",
                        ),
                        width: 125.0,
                        height: 81.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 12.0, top: 3.01),
                        child: CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Color(0xffED1B35),
                          child: Image(
                            image: AssetImage(
                              "images/Layer 41.png",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Image(
                image: AssetImage("images/Mask Group 49.png"),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 75.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        ' أهلا/',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xffED1B35),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data.first_name! + ' ' + data.last_name!,
                        style: const TextStyle(
                            fontSize: 14.0,
                            color: Color(0xffED1B35),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    data.user_email!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Color(0xffC3B0AD)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget ItemPaddingProfile(
  context, {
  required String image,
  required String text,
  int mark = 1,
  double sizeImage = 19.0,
  Widget? nextScreen,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
      child: InkWell(
        onTap: () {
          if (mark == 1) {
            navigatorPush(context, nextScreen!);
          } else {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                elevation: 5,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text(' تسجيل خروج '),
                  ],
                ),
                content: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text('هل تريد تسجيل الخروج ؟'),
                  ],
                ),
                actions: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextButton(
                        onPressed: () async {
                          ShopCubit.get(context).logOutScreen(context);
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.remove('token').then((value) {
                            navigatorPushAndRemove(context, LoginScreen());
                          });
                        },
                        child: const Text(
                          ' تأكيد ',
                          style: TextStyle(color: Color(0xffED1B35)),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text(
                          ' الغاء ',
                          style: TextStyle(color: Color(0xffED1B35)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
        child: Container(
          height: 48.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image(
                  image: AssetImage(
                    "images/$image",
                  ),
                  width: sizeImage,
                  height: sizeImage,
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
                const Icon(
                  Icons.keyboard_arrow_left,
                  color: Color(0xff707070),
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
