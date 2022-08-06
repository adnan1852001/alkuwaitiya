import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBar() => Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Image(
          image: AssetImage(
            'images/02.png',
          ),
          width: 143.0,
          height: 27.0,
        ),
        SizedBox(
          width: 30,
        ),
      ],
    );

Widget appBarText({required String title}) => Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
        ),
      ],
    );
