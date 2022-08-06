// ignore_for_file: non_constant_identifier_names

import 'package:alkuwaitiya_stor/android/app/src/main/java/shared/components/componts/components.dart';
import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/modules/boxshop_screen/receiving_method/receiving_method.dart';
import 'package:alkuwaitiya_stor/shared/method/navigator/navigator.dart';
import 'package:counter/counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoxShopScreen extends StatelessWidget {
  const BoxShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                backgroundColor: const Color(0xffFAFAFA),
                body: cubit.CartModel!.data!.price == "0.000"
                    ? emptyBox()
                    : BoxCart(context)),
          );
        });
  }

  Widget emptyBox() => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('images/Artwork.png'),
              width: 163,
              height: 200,
            ),
            Text(
              'لا يوجد عناصر بعربة التسوق',
              style: TextStyle(fontSize: 17.0, color: Color(0xff494949)),
            ),
          ],
        ),
      );
  Widget BoxCart(context) {
    var cubit = ShopCubit.get(context);
    var data = cubit.CartModel!.data;
    return Column(
      children: [
        SizedBox(
          height: 600,
          child: ListWidget(context),
        ),
        const Spacer(),
        Container(
          color: Colors.white,
          width: double.infinity,
          height: 111.0,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, right: 19.0),
                    child: Text(
                      '${data!.count_products}'
                      ' منتجات '
                      '${data.price_after}'
                      ' '
                      '${data.currency}',
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 13.0,
              ),
              defulteButtom(
                width: 343.0,
                text: 'إختر طريقة الاستلام',
                colorBtn: const Color(0xffED1B35),
                onPressed: () {
                  navigatorPush(context, const ReceivingMethod());
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget ListWidget(context) {
    var cubit = ShopCubit.get(context);
    var data = cubit.CartModel!.data;
    return RefreshIndicator(
      onRefresh: () async {
        return Future.delayed(const Duration(seconds: 2));
      },
      backgroundColor: Colors.grey.shade200,
      color: const Color(0xffED1B35),
      displacement: 20,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      edgeOffset: 20,
      child: ListView.separated(
        separatorBuilder: (context, index) => Container(
          height: 2.0,
          width: double.infinity,
          color: Colors.grey.shade200,
        ),
        itemCount: data!.products!.length,
        itemBuilder: (context, index) => Container(
          height: 140.5,
          color: Colors.white,
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  children: [
                    Image(
                      image: NetworkImage(
                        data.products![index].image!,
                      ),
                      width: 95.0,
                      height: 95.0,
                    ),
                    const SizedBox(
                      width: 14.0,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200.0,
                            child: Text(
                              data.products![index].name!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12.0),
                            ),
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                data.products![index].price_after! +
                                    data.products![index].currency!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffED1B35)),
                              ),
                            ],
                          ),
                        ]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22.5, top: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset('images/Group 10082.png'),
                    const SizedBox(
                      height: 26.0,
                    ),
                    SizedBox(
                      width: 91,
                      height: 37,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Counter(
                              max: data.products![index].max_quantity!,
                              min: data.products![index].min_quantity!,
                              initial: data.products![index].quantity!,
                              onValueChanged: (val) {},
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
