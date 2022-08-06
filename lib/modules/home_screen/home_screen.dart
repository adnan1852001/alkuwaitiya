import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/shared/widgets/app_bar/app_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopStatus>(
      listener: (context, state) {},
      builder: (context, state) => Directionality(
        textDirection: TextDirection.rtl,
        child: ConditionalBuilder(
          condition: state is! HomeLoadingState,
          fallback: (context) => const Center(
            child: CircularProgressIndicator(
              color: Color(0xffED1B35),
              strokeWidth: 2,
              backgroundColor: Colors.grey,
            ),
          ),
          builder: (context) => Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: const Color(0xffED1B35),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: Color(0xffED1B35),
              ),
              title: appBar(),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.black87,
              selectedItemColor: const Color(0xffED1B35),
              backgroundColor: const Color(0xffECECEC),
              currentIndex: ShopCubit.get(context).currentIndex,
              items: [
                BottomNavigationBarItem(
                  label: 'الرئيسية',
                  icon: Image.asset(
                    'images/home.png',
                    width: 22.0,
                    height: 22.0,
                  ),
                  activeIcon: Image.asset(
                    'images/home1.png',
                    width: 22.0,
                    height: 22.0,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'الأقسام',
                  icon: Image.asset(
                    'images/list.png',
                    width: 22.0,
                    height: 22.0,
                  ),
                  activeIcon: Image.asset(
                    'images/‏‏list 1.png',
                    width: 22.0,
                    height: 22.0,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'الماركات',
                  icon: Image.asset(
                    'images/brand.png',
                    width: 22.0,
                    height: 22.0,
                  ),
                  activeIcon: Image.asset(
                    'images/brand.png',
                    width: 22.0,
                    height: 22.0,
                    color: const Color(0xffED1B35),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'عربة التسوق',
                  icon: Image.asset(
                    'images/shopping-cart (1).png',
                    width: 22.0,
                    height: 22.0,
                  ),
                  activeIcon: Image.asset(
                    'images/shopping1.png',
                    width: 22.0,
                    height: 22.0,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'حسابي',
                  icon: Image.asset(
                    'images/user.png',
                    width: 22.0,
                    height: 22.0,
                  ),
                  activeIcon: Image.asset(
                    'images/user1.png',
                    width: 22.0,
                    height: 22.0,
                  ),
                ),
              ],
              onTap: ShopCubit.get(context).changeBtn,
            ),
            body: cubit.Screens[cubit.currentIndex],
          ),
        ),
      ),
    );
  }
}
