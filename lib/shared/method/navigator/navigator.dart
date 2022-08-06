import 'package:flutter/material.dart';

void navigatorPushAndRemove(context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false,
  );
}

void navigatorPush(context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => (widget)),
  );
}
