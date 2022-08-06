import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/models/web_view/web_view.dart';
import 'package:alkuwaitiya_stor/modules/profile_screen/helpcenter_screen/terms_screen/terms_screen.dart';
import 'package:alkuwaitiya_stor/modules/register_screen/privacy_policy_screen.dart';
import 'package:alkuwaitiya_stor/modules/register_screen/replacement_policy_screen.dart.dart';
import 'package:alkuwaitiya_stor/shared/widgets/app_bar/app_bar.dart';
import 'package:alkuwaitiya_stor/shared/widgets/design_helpcenter/design_helpcenter.dart';
import 'package:alkuwaitiya_stor/shared/widgets/design_profile/design_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HelpcenterScreen extends StatelessWidget {
  const HelpcenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        var data = ShopCubit.get(context).HelpCenterModel!.data;

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
                title: appBarText(title: 'مركز المساعدة ')),
            body: Column(
              children: [
                const SizedBox(
                  height: 12.0,
                ),
                DesignHelpCenter(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        ' محادثة حية ',
                        style: TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ),
                ItemPaddingProfile(context,
                    text: 'خدمة العملاء', image: 'support.png', sizeImage: 25),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        ' مساعدة اضافية ',
                        style: TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ),
                ItemPaddingHelpCenter(context,
                    text: 'راسلنا', image: 'send.png'),
                ItemPaddingHelpCenter(context,
                    text: 'الشروط والأحكام',
                    image: 'terms-and-conditions.png',
                    widget: const TermsScreen()),
                ItemPaddingHelpCenter(context,
                    text: 'سياسة الإستبدال والأسترجاع',
                    image: 'term.png',
                    widget: const ReplacementPolicyScreen()),
                ItemPaddingHelpCenter(context,
                    text: 'سياسة الخصوصية',
                    image: 'terms-and-conditions (1).png',
                    widget: const PrivacyPolicyScreen()),
                ItemPaddingHelpCenter(context,
                    text: 'قيمنا', image: 'medal.png'),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 5.0, top: 5.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        ' تابعنا على السوشال ميديا ',
                        style: TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ),
                ItemPaddingHelpCenter(context,
                    text: 'سناب شات',
                    image: 'snapchat.png',
                    widget: WebViewScreen(
                      url: data!.snapchat!,
                    )),
                ItemPaddingHelpCenter(context,
                    text: 'انستغرام',
                    image: 'instagram.png',
                    widget: WebViewScreen(
                      url: data.instagram!,
                    )),
                ItemPaddingHelpCenter(context,
                    text: 'واتساب آب',
                    image: 'whatsapp.png',
                    widget: WebViewScreen(
                      url: data.phone!,
                    )),
                ItemPaddingHelpCenter(
                  context,
                  text: 'يوتيوب',
                  image: 'youtube.png',
                  widget: WebViewScreen(
                    url: data.youtube!,
                  ),
                ),
                ItemPaddingHelpCenter(
                  context,
                  text: 'تلجرام',
                  image: 'telegram.png',
                  widget: WebViewScreen(
                    url: data.telegram!,
                  ),
                ),
                ItemPaddingHelpCenter(
                  context,
                  text: ' فيس بوك',
                  image: 'facebook.png',
                  widget: WebViewScreen(
                    url: data.facebook!,
                  ),
                ),
                ItemPaddingHelpCenter(context,
                    text: 'تويتر',
                    image: 'twitter.png',
                    widget: WebViewScreen(
                      url: data.twitter!,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
