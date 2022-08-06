// ignore_for_file: avoid_print

import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/shared/method/on_pressed_button/on_pressed_button.dart';
import 'package:alkuwaitiya_stor/shared/widgets/cart_details/cart_details.dart';
import 'package:counter/counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget builderDetails(context, indexx, product) {
  var cubit = ShopCubit.get(context);

  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    product.image!,
                    width: 242.0,
                    height: 238.0,
                  ),
                ],
              ),
              product.is_discount == true
                  ? Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffF16654),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              ' تخفيض ' + product.discount_rate!,
                              style: const TextStyle(
                                  fontSize: 12.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const Text(''),
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        size: 30,
                        color: Color(0xffED1B35),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share_outlined,
                        size: 30,
                        color: Color(0xffED1B35),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.compare_arrows_outlined,
                        size: 30,
                        color: Color(0xffED1B35),
                      )),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'images/Layerde.png',
                width: 75,
                color: Colors.black,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                product.brand_name_ar == null
                    ? 'الكويتية '
                    : product.brand_name_ar!,
                style: const TextStyle(
                    color: Color(0xffED1B35),
                    fontWeight: FontWeight.bold,
                    fontSize: 11),
              ),
              product.is_discount == true
                  ? Row(
                      children: [
                        Text(
                          product.currency_ar == null
                              ? ''
                              : product.currency_ar!,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                              decoration: TextDecoration.lineThrough),
                        ),
                        Text(
                          product.price == null ? '' : product.price!,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    )
                  : const Text(''),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 250,
                child: Text(
                  product.name_ar == null ? '' : product.name_ar!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    product.price_after == null ? '' : product.price_after!,
                    style: const TextStyle(
                        color: Color(0xffED1B35),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.currency_ar == null
                        ? product.currency!
                        : product.currency_ar!,
                    style: const TextStyle(
                        color: Color(0xffED1B35),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RatingBar(
                  itemSize: 18,
                  initialRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
                      full: const Icon(Icons.star, color: Color(0xffED1B35)),
                      half: const Icon(
                        Icons.star_half,
                        color: Color(0xffED1B35),
                      ),
                      empty: const Icon(
                        Icons.star,
                        color: Color(0xffC1C8CE),
                      )),
                  onRatingUpdate: (value) {
                    // cubit.postRatesScreen(
                    //   product_id: product.id,
                    //   rate: value,
                    // );
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'السعر شامل إلى المستودع بالكويت',
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
            ],
          ),
          Row(
            children: [
              Card(
                elevation: 5,
                child: SizedBox(
                  width: 140,
                  height: 45,
                  child: Container(
                    color: Colors.white,
                    child: Counter(
                      min: product.min_quantity!,
                      max: product.max_quantity == null
                          ? 200
                          : product.max_quantity!,
                      bound: 1,
                      step: 1,
                      onValueChanged: print,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 221.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xffED1B35),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: MaterialButton(
                  onPressed: () async {
                    showModalBottomsheet(context, indexx, product);
                  },
                  child: const Center(
                    child: Text(
                      ' أضف في عربة التسوق ',
                      style: TextStyle(color: Color(0xffED1B35)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  ShopCubit.get(context).proDescription(true);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'وصف المنتج',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffED1B35)),
                    ),
                    const Spacer(),
                    ShopCubit.get(context).productDescription == true
                        ? const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.grey,
                          ),
                  ],
                ),
              ),
              ShopCubit.get(context).productDescription == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            product.description_ar == null
                                ? product.name_ar!
                                : ' - ' + product.description_ar!,
                            style: const TextStyle(fontSize: 12.0),
                          ),
                        ),
                      ],
                    )
                  : const Text('')
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'منتجات ذات صلة',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xffED1B35)),
              ),
            ],
          ),
          cartDetails(context, indexx, product),
        ],
      ),
    ),
  );
}
