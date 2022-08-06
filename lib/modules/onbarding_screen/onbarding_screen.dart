import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/modules/login_screen/login_screen.dart';
import 'package:alkuwaitiya_stor/shared/method/navigator/navigator.dart';
import 'package:alkuwaitiya_stor/shared/widgets/bottom_image/bottom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnbardingScreen extends StatelessWidget {
  const OnbardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          Future.delayed(const Duration(seconds: 10), () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('boarding', true).then((value) {
              if (value) {
                navigatorPushAndRemove(context, LoginScreen());
              }
            });
          });
          return Scaffold(
            backgroundColor: const Color(0xffFAFAFA),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Layer 4 copy 8.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 73.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Image(
                                image: AssetImage("images/Layer 3.png"),
                                width: 228.0,
                                height: 73.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    '؟',
                                    style: TextStyle(
                                      fontSize: 27.0,
                                      color: Color(0xffED1B35),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 11,
                                  ),
                                  Text(
                                    'شنو تبي من الصين',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 27.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Image(
                                image: AssetImage(
                                  "images/Add to Cart-cuate copy.png",
                                ),
                                width: 315.0,
                                height: 314.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                '..أمر وتدلل',
                                style: TextStyle(
                                  color: Color(0xffED1B35),
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Column(
                                children: const [
                                  Text(
                                    ' نوفر لك كل شي تبيه من الصين الي الكويت ',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xff000000)),
                                  ),
                                  Text(
                                    ' بجودة عاليةوأسعار خيالية ',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xff000000)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    bottomImage(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
