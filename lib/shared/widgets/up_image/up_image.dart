import 'package:flutter/cupertino.dart';

Widget upImage() => Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Padding(
          padding: EdgeInsets.only(
            top: 73.0,
          ),
          child: Image(
            image: AssetImage("images/Layer 3.png"),
            height: 54.0,
            width: 228.0,
          ),
        ),
      ],
    );
