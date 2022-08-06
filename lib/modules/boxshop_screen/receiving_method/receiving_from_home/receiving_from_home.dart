import 'package:alkuwaitiya_stor/shared/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReceivingFromHomeScrren extends StatelessWidget {
  const ReceivingFromHomeScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xffED1B35),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Color(0xffED1B35),
          ),
          title: appBarText(title: 'إتمام الطلب'),
        ),
        body: Center(child: Text('receiving_from_home')),
      ),
    );
  }
}
