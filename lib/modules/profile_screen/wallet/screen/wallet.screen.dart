import 'dart:ui';

import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/shared/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          var data = ShopCubit.get(context).getUpdateProfile!.data!;
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: const Color(0xffFAFAFA),
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: const Color(0xffED1B35),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: Color(0xffED1B35),
                ),
                title: appBarText(title: 'محفظتي ونقاط الولاء'),
              ),
              body: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                        height: 196.0,
                        width: double.infinity,
                        color: const Color(0xffED1B35),
                        child: const Text(''),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 100.0),
                        child: Image(
                          image: AssetImage('images/Card.png'),
                          width: 343.0,
                          height: 209.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      Container(
                        width: 341.0,
                        height: 95.02,
                        decoration: BoxDecoration(
                          color: const Color(0xffED1B35),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          '',
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: [
                          const Image(
                            image: AssetImage(
                              'images/Mask Group 32.png',
                            ),
                            width: 341.0,
                            height: 95.02,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.4),
                            child: Container(
                              width: 207.0,
                              height: 72.0,
                              decoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 19.0, top: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'ID| ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${data.user_id}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${data.first_name}'
                                      ' '
                                      '${data.last_name}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 17.0, left: 22.0),
                        child: Column(
                          children: [
                            const Text(
                              'نقاط الولاء',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18.0),
                            ),
                            Text(
                              '${data.points_price}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 38.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
