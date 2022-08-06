import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/modules/boxshop_screen/receiving_method/receipt_from_warehouse_screen/receipt_from_warehouse_screen.dart';
import 'package:alkuwaitiya_stor/modules/boxshop_screen/receiving_method/receiving_from_home/receiving_from_home.dart';
import 'package:alkuwaitiya_stor/shared/method/navigator/navigator.dart';
import 'package:alkuwaitiya_stor/shared/widgets/app_bar/app_bar.dart';
import 'package:alkuwaitiya_stor/shared/widgets/bottom_image/bottom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReceivingMethod extends StatelessWidget {
  const ReceivingMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        var data = cubit.receivingMethodModel!.data;
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: const Color(0xffFAFAFA),
            appBar: AppBar(
                backgroundColor: const Color(0xffED1B35),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: Color(0xffED1B35),
                ),
                title: appBarText(title: 'إتمام الطلب')),
            body: Column(
              children: [
                const SizedBox(height: 39.8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'اختر طريقة الأستلام المفضلة لديك',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 57.2,
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 19,
                  crossAxisCount: 1,
                  childAspectRatio: 1 / 1,
                  children: List.generate(
                    data!.length,
                    (index) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(5),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                if (data[index].id == 1) {
                                  navigatorPush(
                                      context, const ReceivingFromHomeScrren());
                                } else if (data[index].id == 2) {
                                  navigatorPush(context,
                                      const ReceiptFromWarehouseScreen());
                                }
                              },
                              child: Container(
                                width: 150.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xffEA2036),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(26.0),
                                  child: Image.network(
                                    data[index].image!,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5.8,
                            ),
                            Text(
                              data[index].name!,
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 5.8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '( ',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black),
                                ),
                                Text(
                                  data[index].note!,
                                  style: const TextStyle(
                                      fontSize: 12.0, color: Color(0xffED1B35)),
                                ),
                                const Text(
                                  ' )',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                bottomImage()
              ],
            ),
          ),
        );
      },
    );
  }
}
