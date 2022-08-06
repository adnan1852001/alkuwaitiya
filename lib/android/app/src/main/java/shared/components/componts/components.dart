import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defulteTextFormFeild(
        {required TextEditingController controller,
        Function()? onTap,
        String? validator,
        required String labelText,
        required IconData icon,
        IconData? icon2,
        Function(dynamic)? onSubmit,
        TextInputType? type,
        bool obscureText = false}) =>
    Container(
      color: Colors.white,
      width: 350.0,
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: type,
        controller: controller,
        onTap: onTap,
        onFieldSubmitted: onSubmit,
        validator: (val) {
          if (val!.isEmpty) {
            return validator;
          }
        },
        readOnly: false,
        decoration: InputDecoration(
          labelText: labelText,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(39),
            gapPadding: 5,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black87, // border color
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          // suffix: Icon(suffix),
        ),
      ),
    );

Widget defulteButtom(
        {required String text,
        required Color colorBtn,
        required Function() onPressed,
        double raduis = 39,
        double width = 303.0}) =>
    Container(
      width: width,
      height: 48.0,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ),
      decoration: BoxDecoration(
        color: colorBtn,
        borderRadius: BorderRadius.circular(raduis),
      ),
    );

////////////////////////////////////////////////////////////////////////////////
// Widget defulteComponentCard(context,index)=>Column(
//   children: [
//     Row(
//       children: [
//         IconButton(
//           onPressed: (){},
//           icon: Icon(
//             Icons.favorite_outline_sharp,
//             size: 18,
//             color: Color(0xffED1B35),
//           ),
//         ),
//         Spacer(),
//         Padding(
//           padding: const EdgeInsets.only(right: 10),
//           child: Column(
//             children: [
//               ShopCubit.get(context).HomeModel!.data!.category_slider![1].data!.products![index].is_discount==true?
//               Row(
//                 children: [
//                   Text(
//                     '${ShopCubit.get(context).HomeModel!.data!.category_slider![1].data!.products![index].currency_ar}',
//                     style: const TextStyle(
//                       fontSize: 10.0,
//                       color: Color(0xffC1C8CE),
//                       decoration: TextDecoration.lineThrough,
//                     ),
//                   ),
//                   Text(
//                     '${ShopCubit.get(context).HomeModel!.data!.category_slider![1].data!.products![index].price}',
//                     style: const TextStyle(
//                       fontSize: 10.0,
//                       color: Color(0xffC1C8CE),
//                       decoration: TextDecoration.lineThrough,
//                     ),
//                   ),
//
//                 ],
//               ):
//               Text(''),
//               Row(
//                 children: [
//                   Text(
//                     '${ShopCubit.get(context).HomeModel!.data!.category_slider![1].data!.products![index].currency_ar}',
//                     style: const TextStyle(
//                       fontSize: 11.0,
//                       color:  Color(0xffED1B35),
//
//
//                     ),
//                   ),
//                   Text(
//                     '${ShopCubit.get(context).HomeModel!.data!.category_slider![1].data!.products![index].price_after}',
//                     style: TextStyle(
//                         fontSize: 11.0,
//                         color:  Color(0xffED1B35),
//                         fontWeight: FontWeight.bold
//
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//     ShopCubit.get(context).BtbCard==true?
//     TextButton(
//       onPressed: (){
//         ShopCubit.get(context).changeBtnCard(false);
//       },
//       child:Container(
//           width: double.infinity,
//           height: 26.0,
//           decoration: BoxDecoration(
//               color: Color(0xffF07263),
//               borderRadius: BorderRadius.circular(5)
//           ),
//           child: const Center(
//             child: Text(
//               'في عربة التسوق',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 12.0
//               ),
//             ),
//           )
//       ),
//     ):
//     TextButton(
//       onPressed: (){
//         ShopCubit.get(context).changeBtnCard(true);
//       },
//       child:Container(
//           width: double.infinity,
//           height: 26.0,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(
//                 color: Color(0xffF07263),
//               ),
//               borderRadius: BorderRadius.circular(5)
//           ),
//           child: const Center(
//             child: Text(
//               'أضف إلى عربة التسوق',
//               style: TextStyle(
//                   color: Color(0xffED1B35),
//                   fontSize: 12.0
//               ),
//             ),
//           )
//       ),
//     )
//
//   ],
// );
