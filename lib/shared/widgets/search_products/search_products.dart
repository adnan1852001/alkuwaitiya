// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget SearchProducts({required String? title}) {
  return Container(
    width: 180.0,
    height: 39.0,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.grey.shade300,
        width: 1,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(right: 9.8, left: 12.7),
      child: Row(
        children: [
          Container(
            width: 120,
            child: Text(
              title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13.0, color: Color(0xff9C9DA5)),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Color(0xffEE6376),
            size: 30.0,
          )
        ],
      ),
    ),
  );
}
