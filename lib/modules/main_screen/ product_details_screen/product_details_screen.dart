// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/models/home_model/home_model.dart';
import 'package:alkuwaitiya_stor/shared/method/refresh/refresh.dart';
import 'package:alkuwaitiya_stor/shared/widgets/app_bar/app_bar.dart';
import 'package:alkuwaitiya_stor/shared/widgets/builder_details/builder_details.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//ProductDetailsScreen
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen(
    this.product,
    this.indexx,
  );
  final ProductsData product;
  final int indexx;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          var categorySlider =
              ShopCubit.get(context).HomeModel!.data!.category_slider;

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: const Color(0xffED1B35),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: Color(0xffED1B35),
                ),
                title: appBarText(title: 'تفاصيل المنتج'),
              ),
              body: RefreshIndicator(
                onRefresh: refresh,
                backgroundColor: Colors.grey.shade200,
                color: Color(0xffED1B35),
                displacement: 20,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                edgeOffset: 20,
                child: ConditionalBuilder(
                  condition: product.image != null,
                  fallback: (context) => const Center(
                      child: CircularProgressIndicator(
                    color: Color(0xffED1B35),
                    strokeWidth: 2,
                    backgroundColor: Colors.grey,
                  )),
                  builder: (context) =>
                      builderDetails(context, indexx, product),
                ),
              ),
            ),
          );
        });
  }
}
