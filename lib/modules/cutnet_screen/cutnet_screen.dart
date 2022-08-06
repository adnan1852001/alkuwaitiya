import 'dart:ui';

import 'package:alkuwaitiya_stor/android/app/src/main/java/shared/components/componts/components.dart';
import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class cutnet_screen extends StatelessWidget {
  const cutnet_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 93.0),
                  child: Image(
                    image: AssetImage(
                      "images/Layer 3.png",
                    ),
                    width: 228.0,
                    height: 54.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 39.26,
            ),
            const Text(
              ' تعذر الاتصال بالأنترنت ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 23.0,
              ),
            ),
            const SizedBox(
              height: 29.42,
            ),
            Column(
              children: [
                Text(
                  ' تعذر الإتصال بشبكة الانترنت لديك رجاءاً تأكد ',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  ' من وجود خدمة الإنترنت من ثم قم بتحديث الصفحة ',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50.96,
            ),
            const Image(
              image: AssetImage(
                "images/3819738 copy.png",
              ),
              width: 335.0,
              height: 192,
            ),
            const SizedBox(
              height: 65.0,
            ),
            defulteButtom(
                onPressed: () {}, colorBtn: Color(0xffED1B35), text: ' تحديث '),
            const Expanded(
              child: SizedBox(
                height: 0.0,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Image(
                  image: AssetImage("images/Layer 4.png"),
                  width: double.infinity,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
