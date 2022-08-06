// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/modules/profile_screen/about_screen/about_screen.dart';
import 'package:alkuwaitiya_stor/modules/profile_screen/favorite_screen/favorite_screen.dart';
import 'package:alkuwaitiya_stor/modules/profile_screen/helpcenter_screen/helpcenter_screen.dart';
import 'package:alkuwaitiya_stor/modules/profile_screen/information_screen/information_screen.dart';
import 'package:alkuwaitiya_stor/modules/profile_screen/wallet/screen/wallet.screen.dart';
import 'package:alkuwaitiya_stor/shared/widgets/design_profile/design_profile.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'applicationsettings_screen/applicationsettings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        // var data = ShopCubit.get(context).loginModel!.data;
        return ConditionalBuilder(
          condition: state is! GetUpdateProfileLoadingState,
          fallback: (context) => const Center(
            child: CircularProgressIndicator(
              color: Color(0xffED1B35),
              strokeWidth: 2,
              backgroundColor: Colors.grey,
            ),
          ),
          builder: (context) => Scaffold(
            backgroundColor: const Color(0xffFAFAFA),
            body: Column(
              children: [
                DesignProfile(context),
                ItemPaddingProfile(
                  context,
                  image: 'information.png',
                  text: 'معلوماتي',
                  nextScreen: InformationScreen(),
                ),
                ItemPaddingProfile(context,
                    image: 'heart.png',
                    text: 'مفضلتي',
                    nextScreen: const FavoriteScreen()),
                ItemPaddingProfile(
                  context,
                  image: 'protected.png',
                  text: 'طلباتي',
                ),
                ItemPaddingProfile(
                  context,
                  image: 'address.png',
                  text: 'عناويني',
                ),
                ItemPaddingProfile(
                  context,
                  image: 'wallet.png',
                  text: 'المحفظة',
                  nextScreen: const WalletScreen(),
                ),
                ItemPaddingProfile(
                  context,
                  image: 'question.png',
                  text: 'مركز المساعدة',
                  nextScreen: const HelpcenterScreen(),
                ),
                ItemPaddingProfile(context,
                    image: 'settings.png',
                    text: 'اعدادات التطبيق',
                    nextScreen: const ApplicationSettingsScreen()),
                ItemPaddingProfile(context,
                    image: 'information.png',
                    text: 'عن الكويتية ستور ',
                    nextScreen: const AboutScreen()),
                ItemPaddingProfile(context,
                    image: 'logout.png', text: 'تسجيل خروج', mark: 2),
                const SizedBox(
                  height: 17.4,
                ),
                const Text(
                  'نسخة التطبيق 4.20.3',
                  style: TextStyle(color: Color(0xff5E5F63), fontSize: 11.0),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
