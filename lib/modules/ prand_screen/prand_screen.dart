import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrandScreen extends StatelessWidget {
  const PrandScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
        listener: (context, state) => {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          var brandsSlider = cubit.HomeModel!.data!.brands_slider;
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: const Color(0xffFAFAFA),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 1,
                      crossAxisCount: 2,
                      children: List.generate(
                        brandsSlider!.length,
                        (index) => Image(
                          image: NetworkImage('${brandsSlider[index].image}'),
                          width: 162.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
