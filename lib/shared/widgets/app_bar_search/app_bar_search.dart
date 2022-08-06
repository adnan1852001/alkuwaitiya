import 'package:alkuwaitiya_stor/modules/search_screen/search_screen.dart';
import 'package:alkuwaitiya_stor/shared/method/navigator/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarSearch(context) => Row(
      children: [
        InkWell(
          onTap: () {},
          child: const Image(
            image: AssetImage("images/listcat.png"),
            width: 25.0,
            height: 25.0,
          ),
        ),
        const SizedBox(
          width: 13.0,
        ),
        InkWell(
          onTap: () {
            navigatorPush(context, const SearchScreen());
          },
          child: Container(
            width: 340.0,
            height: 39.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/Icon feather-search.png',
                    width: 19.47,
                    height: 19.47,
                  ),
                  const SizedBox(
                    width: 13.0,
                  ),
                  Text(
                    'ما الذي تبحث عنه؟',
                    style:
                        TextStyle(color: Colors.grey.shade400, fontSize: 13.0),
                  ),
                  const Spacer(),
                  Image.asset(
                    'images/Group 10048.png',
                    width: 24.98,
                    height: 20.51,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
