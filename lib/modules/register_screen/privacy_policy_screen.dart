import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/shared/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: const Color(0xffFAFAFA),
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: const Color(0xffED1B35),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: Color(0xffED1B35),
              ),
              title: appBar(),
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Layer 4 copy 8.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Html(
                  data:
                      """${ShopCubit.get(context).HelpCenterModel!.data!.privacy_policy}""",
                  style: {
                    "body": Style(
                      fontSize: const FontSize(14.0),
                      fontWeight: FontWeight.bold,
                    ),
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
