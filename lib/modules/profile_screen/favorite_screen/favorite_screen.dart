import 'package:alkuwaitiya_stor/layout/cubit/shop_cubit.dart';
import 'package:alkuwaitiya_stor/layout/status/shop_states.dart';
import 'package:alkuwaitiya_stor/shared/method/refresh/refresh.dart';
import 'package:alkuwaitiya_stor/shared/widgets/app_bar/app_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        var data = cubit.favoriteModel!.data;
        return ConditionalBuilder(
          condition: state is! FavoritLoadingState,
          builder: (context) => Directionality(
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
                title: appBarText(title: ' مفضلتي'),
              ),
              body: RefreshIndicator(
                onRefresh: refresh,
                backgroundColor: Colors.grey.shade200,
                color: const Color(0xffED1B35),
                displacement: 50,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                edgeOffset: 20,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 16.0, bottom: 19.0),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: data!.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                      data[index].image!,
                                    ),
                                    width: 80.0,
                                    height: 78.0,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  SizedBox(
                                    width: 190,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index].name!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Color(0xff5C5F63),
                                              fontSize: 13.0),
                                        ),
                                        data[index].price ==
                                                data[index].price_after
                                            ? const Text('')
                                            : Text(
                                                '${data[index].price}${data[index].currency!}',
                                                style: const TextStyle(
                                                    color: Color(0xffA2A2A2),
                                                    fontSize: 10.0,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              ),
                                        Text(
                                          '${data[index].price_after!} ${data[index].currency!}',
                                          style: const TextStyle(
                                              color: Color(0xff5C5F63),
                                              fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Text(
                                      data[index].favorite_date!,
                                      style: const TextStyle(
                                          color: Color(0xff5C5F63),
                                          fontSize: 12.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                cubit.removeFavoriteScreen(
                                    context, data[index].id!);
                              },
                              child: const Icon(
                                Icons.cancel_outlined,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(
              color: Color(0xffED1B35),
              strokeWidth: 2,
              backgroundColor: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
