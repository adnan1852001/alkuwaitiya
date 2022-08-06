import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/modules/boxshop_screen/boxshop_screen.dart';
import 'package:alkuwaitiya_stor/modules/main_screen/%20product_details_screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:simple_timer/simple_timer.dart';

Future<void> showModalBottomsheet(context, indexx, product) async {
  var categorySlider = ShopCubit.get(context).HomeModel!.data!.category_slider;
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SizedBox(
        height: 530,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: const [
                      Text(
                        '  تمت إضافة المنتج لعربة التسوق  ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '  قيمة السلة : 1 منتجات - 14.49 ريال      ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5E5F63),
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 60,
                      width: 60,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          SimpleTimer(
                            status: TimerStatus.start,
                            duration: const Duration(seconds: 10),
                            strokeWidth: 5,
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.check_circle_rounded,
                              color: Colors.green,
                              size: 40,
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            const Text(
              '_______________________________________________________________________',
              maxLines: 1,
              style: TextStyle(color: Colors.grey),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  '  قد يعجبك أيضا  ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
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
                          itemBuilder:
                              (context, index) =>
                                  ShopCubit.get(context)
                                              .HomeModel!
                                              .data!
                                              .category_slider![indexx]
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
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProductDetailsScreen(
                                                              categorySlider![
                                                                          indexx]
                                                                      .data!
                                                                      .products![
                                                                  index],
                                                              indexx,
                                                            )),
                                                  );
                                                },
                                                child: Card(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Image(
                                                              image:
                                                                  NetworkImage(
                                                                '${ShopCubit.get(context).HomeModel!.data!.category_slider![indexx].data!.products![index].image}',
                                                              ),
                                                              width: 144.0,
                                                              height: 141.0,
                                                            ),
                                                            ShopCubit.get(context)
                                                                        .HomeModel!
                                                                        .data!
                                                                        .category_slider![
                                                                            indexx]
                                                                        .data!
                                                                        .products![
                                                                            index]
                                                                        .is_new ==
                                                                    true
                                                                ? Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        25.0,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      color: Color(
                                                                          0xffEE495A),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topRight:
                                                                            Radius.circular(25),
                                                                        bottomRight:
                                                                            Radius.circular(25),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        'جديد',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13.0,
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                    ),
                                                                  )
                                                                : const Text(
                                                                    ''),
                                                          ],
                                                        ),
                                                        const Text(
                                                          'ZUMIX',
                                                          style: TextStyle(
                                                              fontSize: 6,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        Expanded(
                                                          child: SizedBox(
                                                            height: 45,
                                                            child: Text(
                                                              '${ShopCubit.get(context).HomeModel!.data!.category_slider![indexx].data!.products![index].name_ar}',
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                RatingBar(
                                                                    itemSize:
                                                                        18,
                                                                    initialRating:
                                                                        0,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    allowHalfRating:
                                                                        false,
                                                                    itemCount:
                                                                        5,
                                                                    ratingWidget:
                                                                        RatingWidget(
                                                                            full: const Icon(Icons.star,
                                                                                color: Color(
                                                                                    0xffFEC506)),
                                                                            half:
                                                                                const Icon(
                                                                              Icons.star_half,
                                                                              color: Colors.white,
                                                                            ),
                                                                            empty:
                                                                                const Icon(
                                                                              Icons.star,
                                                                              color: Color(0xffC1C8CE),
                                                                            )),
                                                                    onRatingUpdate:
                                                                        (value) {
                                                                      print(value
                                                                          .toInt());
                                                                    }),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    categorySlider![indexx].data!.products![index].is_discount ==
                                                                            true
                                                                        ? Text(
                                                                            product.discount_rate!,
                                                                            style:
                                                                                const TextStyle(color: Color(0xffED1B35), fontWeight: FontWeight.bold),
                                                                          )
                                                                        : const Text(
                                                                            ''),
                                                                    const Spacer(),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          right:
                                                                              10),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          categorySlider[indexx].data!.products![index].is_discount == true
                                                                              ? Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      '${ShopCubit.get(context).HomeModel!.data!.category_slider![1 + 1].data!.products![index].currency_ar}',
                                                                                      style: const TextStyle(
                                                                                        fontSize: 10.0,
                                                                                        color: Color(0xffC1C8CE),
                                                                                        decoration: TextDecoration.lineThrough,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      '${ShopCubit.get(context).HomeModel!.data!.category_slider![1 + 1].data!.products![index].price}',
                                                                                      style: const TextStyle(
                                                                                        fontSize: 10.0,
                                                                                        color: Color(0xffC1C8CE),
                                                                                        decoration: TextDecoration.lineThrough,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                )
                                                                              : const Text(''),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                '${ShopCubit.get(context).HomeModel!.data!.category_slider![indexx].data!.products![index].currency}',
                                                                                style: const TextStyle(
                                                                                  fontSize: 19.0,
                                                                                  color: Color(0xffED1B35),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                '${ShopCubit.get(context).HomeModel!.data!.category_slider![indexx].data!.products![index].price_after}',
                                                                                style: const TextStyle(fontSize: 19.0, color: Color(0xffED1B35), fontWeight: FontWeight.bold),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const Text(
                                                                  '______________________________________________________',
                                                                  maxLines: 1,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                                TextButton(
                                                                  onPressed:
                                                                      () {},
                                                                  child: ShopCubit.get(context)
                                                                              .HomeModel!
                                                                              .data!
                                                                              .category_slider![
                                                                                  indexx]
                                                                              .data!
                                                                              .products![
                                                                                  index]
                                                                              .in_cart ==
                                                                          true
                                                                      ? const SizedBox(
                                                                          width: double
                                                                              .infinity,
                                                                          height:
                                                                              26.0,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              'في السلة',
                                                                              style: TextStyle(color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ))
                                                                      : const SizedBox(
                                                                          width: double
                                                                              .infinity,
                                                                          height:
                                                                              26.0,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              ' + '
                                                                              'أضف للسلة',
                                                                              style: TextStyle(color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.bold),
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
                          itemCount: ShopCubit.get(context)
                              .HomeModel!
                              .data!
                              .category_slider![indexx]
                              .data!
                              .products!
                              .length,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BoxShopScreen()),
                        );
                      },
                      child: const Center(
                        child: Text(
                          ' إتمام الشراء ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text(
                          ' إكمال التسوق ',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
    isScrollControlled: true,
  );
  await Future.delayed(const Duration(seconds: 10)).then((value) {
    Navigator.pop(context);
  });
}
