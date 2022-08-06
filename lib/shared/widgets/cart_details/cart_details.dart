// ignore_for_file: avoid_print

import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/modules/main_screen/%20product_details_screen/product_details_screen.dart';
import 'package:alkuwaitiya_stor/shared/method/navigator/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget cartDetails(context, indexx, product) {
  var categorySlider = ShopCubit.get(context).HomeModel!.data!.category_slider;
  return Column(
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            SizedBox(
              height: 340.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => categorySlider![indexx]
                            .data!
                            .products![index]
                            .id !=
                        product.id
                    ? SizedBox(
                        width: 170,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: InkWell(
                              onTap: () {
                                navigatorPush(
                                  context,
                                  ProductDetailsScreen(
                                      categorySlider[indexx]
                                          .data!
                                          .products![index],
                                      indexx),
                                );
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: AlignmentDirectional.topEnd,
                                        children: [
                                          Image(
                                            image: NetworkImage(
                                              '${categorySlider[indexx].data!.products![index].image}',
                                            ),
                                            width: 144.0,
                                            height: 141.0,
                                          ),
                                          categorySlider[indexx]
                                                      .data!
                                                      .products![index]
                                                      .is_new ==
                                                  true
                                              ? Container(
                                                  width: 50.0,
                                                  height: 25.0,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xffEE495A),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'جديد',
                                                      style: TextStyle(
                                                          fontSize: 13.0,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                              : const Text(''),
                                        ],
                                      ),
                                      const Text(
                                        'ZUMIX',
                                        style: TextStyle(
                                            fontSize: 6,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 45,
                                          child: Text(
                                            '${categorySlider[indexx].data!.products![index].name_ar}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              RatingBar(
                                                  itemSize: 18,
                                                  initialRating: 0,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: false,
                                                  itemCount: 5,
                                                  ratingWidget: RatingWidget(
                                                      full: const Icon(
                                                          Icons.star,
                                                          color: Color(
                                                              0xffFEC506)),
                                                      half: const Icon(
                                                        Icons.star_half,
                                                        color: Colors.white,
                                                      ),
                                                      empty: const Icon(
                                                        Icons.star,
                                                        color:
                                                            Color(0xffC1C8CE),
                                                      )),
                                                  onRatingUpdate: (value) {
                                                    print(value.toInt());
                                                  }),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: Column(
                                                      children: [
                                                        ShopCubit.get(context)
                                                                    .HomeModel!
                                                                    .data!
                                                                    .category_slider![
                                                                        indexx]
                                                                    .data!
                                                                    .products![
                                                                        index]
                                                                    .is_discount ==
                                                                true
                                                            ? Row(
                                                                children: [
                                                                  Text(
                                                                    '${categorySlider[1 + 1].data!.products![index].currency_ar}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          10.0,
                                                                      color: Color(
                                                                          0xffC1C8CE),
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "${categorySlider[1 + 1].data!.products![index].price}",
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          10.0,
                                                                      color: Color(
                                                                          0xffC1C8CE),
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough,
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            : const Text(''),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              '${categorySlider[indexx].data!.products![index].price_after}',
                                                              style: const TextStyle(
                                                                  fontSize:
                                                                      11.0,
                                                                  color: Color(
                                                                      0xffED1B35),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              categorySlider[
                                                                          indexx]
                                                                      .data!
                                                                      .products![
                                                                          index]
                                                                      .currency_ar ??
                                                                  'د.ك',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 11.0,
                                                                color: Color(
                                                                    0xffED1B35),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons
                                                          .favorite_outline_sharp,
                                                      size: 18,
                                                      color: Color(0xffED1B35),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: ShopCubit.get(context)
                                                            .HomeModel!
                                                            .data!
                                                            .category_slider![
                                                                indexx]
                                                            .data!
                                                            .products![index]
                                                            .in_cart ==
                                                        true
                                                    ? Container(
                                                        width: double.infinity,
                                                        height: 26.0,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xffF07263),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                        child: const Center(
                                                          child: Text(
                                                            'أضف إلى عربة التسوق',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffED1B35),
                                                                fontSize: 12.0),
                                                          ),
                                                        ))
                                                    : Container(
                                                        width: double.infinity,
                                                        height: 26.0,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xffF07263),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                        child: const Center(
                                                          child: Text(
                                                            'أضف إلى عربة التسوق',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffED1B35),
                                                                fontSize: 12.0),
                                                          ),
                                                        )),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      )
                    : const Text(''),
                itemCount: categorySlider![indexx].data!.products!.length,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
