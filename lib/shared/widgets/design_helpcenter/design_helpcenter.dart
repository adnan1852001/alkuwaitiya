// ignore_for_file: non_constant_identifier_names

import 'package:alkuwaitiya_stor/shared/method/navigator/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget DesignHelpCenter() => Stack(
      children: [
        Container(
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [
              Image(
                image: AssetImage(
                  "images/Layer 45.png",
                ),
                height: 130,
                width: 193.0,
              ),
              Image(
                image: AssetImage(
                  "images/Layer 45 copy.png",
                ),
                height: 130.0,
                width: 194.0,
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: const [
                  Image(
                    image: AssetImage("images/Layer 1.png"),
                    width: 50.0,
                    height: 50.0,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    ' دائما في خدمتك ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' تحدث إلينا الأن ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );

Widget ItemPaddingHelpCenter(
  context, {
  Widget? widget,
  required String text,
  required String image,
}) =>
    Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              final Uri _url = Uri.parse('https://flutter.dev');
              navigatorPush(context, widget!);
            },
            child: Container(
              height: 29.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(
                        "images/$image",
                      ),
                      width: 19.0,
                      height: 19.0,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                          fontSize: 11.0, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_left,
                      color: Color(0xff707070),
                      size: 14.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
