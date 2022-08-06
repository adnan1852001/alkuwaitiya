import 'dart:developer';

import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/modules/onbarding_screen/onbarding_screen.dart';
import 'package:alkuwaitiya_stor/shared/network/remote/dio_helper.dart';
import 'package:alkuwaitiya_stor/shared/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/home_screen/home_screen.dart';
import 'modules/login_screen/login_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool onboarding = prefs.getBool('boarding') ?? false;
      String token = prefs.getString('token') ?? "";
      log('token');
      log(token);
      log(onboarding.toString());
      DioHelper.init();
      Widget wighet;
      if (onboarding != false) {
        if (token != '') {
          wighet = const HomeScreen();
        } else {
          wighet = LoginScreen();
        }
      } else {
        wighet = const OnbardingScreen();
      }
      runApp(MyApp(wighet));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp(this.startWighet, {Key? key}) : super(key: key);

  final Widget startWighet;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit()
        ..getUpDateProfile()
        ..HomeScreen()
        ..categoryScreen()
        ..subCategoryScreen(1)
        ..getFavoriteScreen()
        ..HelpCenterScrren()
        ..produceCartScreen()
        ..receivingMethodScreen(),
      child: BlocConsumer<ShopCubit, ShopStatus>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  systemNavigationBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.dark,
                  statusBarColor: Colors.black),
            ),
            fontFamily: 'Sans',
          ),
          home: startWighet,
        ),
      ),
    );
  }
}
