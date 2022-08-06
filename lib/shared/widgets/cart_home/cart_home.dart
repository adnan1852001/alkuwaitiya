// ignore_for_file: avoid_print

import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/modules/main_screen/%20product_details_screen/product_details_screen.dart';
import 'package:alkuwaitiya_stor/shared/method/navigator/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget cartHome(context,
    {required int indexCategoryImage,
    required int indexProducts,
    required int indexCategoryProduct}) {
  var cubit = ShopCubit.get(context);
  var data = ShopCubit.get(context).HomeModel!.data;
  var products1 = data!.category_slider![indexCategoryProduct].data!.products;
  var categorySlider = ShopCubit.get(context).HomeModel!.data!.category_slider;
  return Column(
    children: [
      GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 20,
        crossAxisCount: 1,
        mainAxisSpacing: 2,
        childAspectRatio: 1 / 0.35,
        children: List.generate(
          1,
          (index) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox.fromSize(
              size: const Size.fromRadius(5),
              child: Image(
                image: NetworkImage(
                  '${data.category_slider![indexCategoryImage].data!.products![indexProducts].image_ar}',
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
      const SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '${categorySlider![indexCategoryImage].data!.name_ar}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13.0,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Row(
              children: const [
                Text(
                  'عرض الكل',
                  style: TextStyle(fontSize: 10.0, color: Color(0xffED1B35)),
                ),
                Icon(
                  Icons.arrow_back_ios_new,
                  size: 10,
                  color: Color(0xffED1B35),
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      SizedBox(
        height: 330.0,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => SizedBox(
            width: 170,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: InkWell(
                onTap: () {
                  navigatorPush(
                    context,
                    ProductDetailsScreen(
                      products1![index],
                      indexCategoryProduct,
                    ),
                  );
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Image(
                              image: NetworkImage(
                                products1![index].image!,
                              ),
                              width: 144.0,
                              height: 141.0,
                            ),
                            products1[index].is_new == true
                                ? Container(
                                    width: 50.0,
                                    height: 25.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffEE495A),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
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
                              products1[index].name_ar!,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RatingBar(
                                    itemSize: 18,
                                    initialRating: 0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    ratingWidget: RatingWidget(
                                        full: const Icon(Icons.star,
                                            color: Color(0xffFEC506)),
                                        half: const Icon(
                                          Icons.star_half,
                                          color: Colors.white,
                                        ),
                                        empty: const Icon(
                                          Icons.star,
                                          color: Color(0xffC1C8CE),
                                        )),
                                    onRatingUpdate: (value) {}),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Column(
                                        children: [
                                          products1[index].is_discount == true
                                              ? Row(
                                                  children: [
                                                    Text(
                                                      products1[index].price!,
                                                      style: const TextStyle(
                                                        fontSize: 10.0,
                                                        color:
                                                            Color(0xffC1C8CE),
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                    ),
                                                    Text(
                                                      products1[index]
                                                          .currency_ar!,
                                                      style: const TextStyle(
                                                        fontSize: 10.0,
                                                        color:
                                                            Color(0xffC1C8CE),
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
                                                '${products1[index].price_after}',
                                                style: const TextStyle(
                                                    fontSize: 11.0,
                                                    color: Color(0xffED1B35),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                products1[index].currency!,
                                                style: const TextStyle(
                                                  fontSize: 11.0,
                                                  color: Color(0xffED1B35),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        cubit.addFavoriteScreen(
                                            context, products1[index].id);
                                        print(products1[index].id);
                                      },
                                      icon:
                                          cubit.favorite[products1[index].id] ==
                                                  true
                                              ? const Icon(
                                                  Icons.favorite_outlined,
                                                  size: 18,
                                                  color: Color(0xffED1B35),
                                                )
                                              : const Icon(
                                                  Icons.favorite_outline_sharp,
                                                  size: 18,
                                                  color: Color(0xffED1B35),
                                                ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    print(products1[index].id);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 26.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color(0xffF07263),
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Center(
                                      child: Text(
                                        'أضف إلى عربة التسوق',
                                        style: TextStyle(
                                            color: Color(0xffED1B35),
                                            fontSize: 12.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          itemCount: products1!.length,
        ),
      ),
    ],
  );
}
