// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/modules/%20parts_screen/products_screen/products_screen.dart';
import 'package:alkuwaitiya_stor/shared/method/navigator/navigator.dart';
import 'package:alkuwaitiya_stor/shared/method/refresh/refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PartsScreen extends StatelessWidget {
  PartsScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          var data = cubit.CategoryModel!.data!;
          var data2 = cubit.CategoryModel2!.data!;

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: RefreshIndicator(
                onRefresh: refresh,
                backgroundColor: Colors.grey.shade200,
                color: const Color(0xffED1B35),
                displacement: 50,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                edgeOffset: 20,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 119.0,
                      color: Colors.grey.shade200,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  cubit.setCategoryIndex(index);
                                  cubit.subCategoryScreen(data[index].id!);
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color: cubit.categoryIndex == index
                                        ? const Color(0xffc4161c)
                                        : Colors.grey.shade300,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image(
                                      image: NetworkImage(
                                        data[index].image!,
                                      ),
                                      color: cubit.categoryIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                data[index].name!,
                                style: TextStyle(
                                  color: cubit.categoryIndex == index
                                      ? const Color(0xffED1B35)
                                      : Colors.black,
                                  fontSize: 12.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ListView.builder(
                          itemCount: data2.length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              const SizedBox(
                                height: 9.0,
                              ),
                              InkWell(
                                onTap: () {
                                  navigatorPush(context,
                                      ProductsScreen('${data2[index].name}'));
                                  cubit.setCategoryTextIndex(index);
                                },
                                child: Container(
                                  width: 227.0,
                                  height: 42.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: cubit.categoryTextIndex == index
                                          ? const Color(0xffc4161c)
                                          : Colors.grey.shade100,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      data2[index].name!,
                                      style: TextStyle(
                                          color:
                                              cubit.categoryTextIndex == index
                                                  ? const Color(0xffc4161c)
                                                  : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
