// ignore_for_file: use_key_in_widget_constructors

import 'package:alkuwaitiya_stor/shared/widgets/app_bar/app_bar.dart';
import 'package:alkuwaitiya_stor/shared/widgets/search_products/search_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen(this.title);
  final String? title;
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
          title: appBarText(title: title!),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchProducts(title: 'رتب حسب'),
              // const Spacer(),
              SizedBox(
                width: 17.0,
              ),
              SearchProducts(title: title),
            ],
          ),
        ),
      ),
    );
  }
}
