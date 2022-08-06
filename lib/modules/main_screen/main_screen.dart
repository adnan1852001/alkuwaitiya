// ignore_for_file: non_constant_identifier_names, must_be_immutable, avoid_print

import 'dart:ui';

import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/shared/method/refresh/refresh.dart';
import 'package:alkuwaitiya_stor/shared/widgets/app_bar_search/app_bar_search.dart';
import 'package:alkuwaitiya_stor/shared/widgets/cart_home/cart_home.dart';
import 'package:alkuwaitiya_stor/shared/widgets/cart_home2/cart_home2.dart';
import 'package:alkuwaitiya_stor/shared/widgets/slider/slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  var SearchController = TextEditingController();
  var boardController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        var data = ShopCubit.get(context).HomeModel!.data;
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xffED1B35),
              title: appBarSearch(context),
            ),
            body: RefreshIndicator(
              onRefresh: refresh,
              backgroundColor: Colors.grey.shade200,
              color: Color(0xffED1B35),
              displacement: 50,
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              edgeOffset: 20,
              child: ConditionalBuilder(
                condition: ShopCubit.get(context).HomeModel!.status == true,
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffED1B35),
                    strokeWidth: 2,
                    backgroundColor: Colors.grey,
                  ),
                ),
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        slider(context),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisSpacing: 19,
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 1,
                              children: List.generate(
                                2,
                                (index) => ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(5),
                                    child: ConditionalBuilder(
                                      condition: state is! ShopLoadingState,
                                      fallback: (context) => const Center(
                                          child: CircularProgressIndicator(
                                        color: Color(0xffED1B35),
                                        strokeWidth: 2,
                                        backgroundColor: Colors.grey,
                                      )),
                                      builder: (context) => ConditionalBuilder(
                                        condition: data!
                                                .category_slider![0]
                                                .data!
                                                .products![index]
                                                .image_ar !=
                                            null,
                                        fallback: (context) => const Center(
                                          child: CircularProgressIndicator(
                                            color: Color(0xffED1B35),
                                            strokeWidth: 1,
                                            backgroundColor: Colors.grey,
                                          ),
                                        ),
                                        builder: (context) => Image(
                                          image: NetworkImage(
                                            '${ShopCubit.get(context).HomeModel!.data!.category_slider![0].data!.products![index].image_ar}',
                                          ),
                                          //fit: BoxFit.cover,
                                          fit: BoxFit.fill,

                                          width: 167.0,
                                          height: 113.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        cartHome2(context, indexCategorySlider: 1),
                        cartHome(
                          context,
                          indexCategoryImage: 2,
                          indexProducts: 0,
                          indexCategoryProduct: 3,
                        ),
                        for (var i = 4; i < 14; i++)
                          if (i % 2 != 0)
                            cartHome(context,
                                indexCategoryImage: i - 1,
                                indexProducts: 0,
                                indexCategoryProduct: i),
                        cartHome2(context, indexCategorySlider: 14),
                        for (var i = 14; i < data!.category_slider!.length; i++)
                          if (i % 2 != 0)
                            cartHome(context,
                                indexCategoryImage: i,
                                indexProducts: 0,
                                indexCategoryProduct: i + 1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
