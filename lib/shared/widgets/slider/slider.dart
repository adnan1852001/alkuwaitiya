// ignore_for_file: non_constant_identifier_names

import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget slider(context) {
  var cubit = ShopCubit.get(context);
  var data = ShopCubit.get(context).HomeModel!.data;
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              cubit.indexPage(index);
            },
            height: 170,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayCurve: Curves.easeInOutQuint,
            viewportFraction: 1.0,
          ),
          items: data!.main_slider!
              .map((e) => ConditionalBuilder(
                    condition: data.main_slider != null,
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffED1B35),
                        strokeWidth: 1,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    builder: (context) => Image(
                      image: NetworkImage('${e.image}'),
                      height: 353,
                      fit: BoxFit.fill,
                    ),
                  ))
              .toList(),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: AnimatedSmoothIndicator(
            activeIndex: cubit.activeindex,
            count: data.main_slider!.length,
            effect: const WormEffect(
              activeDotColor: Colors.deepOrange,
              dotColor: Color(0xffafb2a9),
              dotHeight: 3,
              spacing: 1,
            ),
          ),
        )
      ],
    ),
  );
}
