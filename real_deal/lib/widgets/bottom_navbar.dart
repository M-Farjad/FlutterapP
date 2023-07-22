// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// import '../../values/custom_colors.dart';
// import '../../values/shadows.dart';
// import '../controllers/bottom_navbar_controller.dart';
// import '../values/assets.dart';

// class BottomNavBar extends StatelessWidget {
//   BottomNavBar({
//     super.key,
//   });

//   final BottomNavController btmController = Get.put(BottomNavController());

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         height: 80,
//         decoration: ShapeDecoration(
//           color: CustomColors.whiteColor,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(34),
//               topRight: Radius.circular(34),
//             ),
//           ),
//           shadows: CustomShadows.shadowsAbove,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 btmController.updateSelectedIndex(0);
//               },
//               child: InkResponse(
//                   child: Obx(
//                 () => SvgPicture.asset(
//                   btmController.selectedIndex.value == 0
//                       ? Assets.homeSelected
//                       : Assets.home,
//                 ),
//               )),
//             ),
//             GestureDetector(
//               onTap: () {
//                 btmController.updateSelectedIndex(1);
//               },
//               child: InkResponse(
//                   child: Obx(
//                 () => SvgPicture.asset(
//                   btmController.selectedIndex.value == 1
//                       ? Assets.heartSelected
//                       : Assets.heart,
//                 ),
//               )),
//             ),
//             GestureDetector(
//               onTap: () {
//                 btmController.updateSelectedIndex(2);
//               },
//               child: InkResponse(
//                 child: Obx(
//                   () => SvgPicture.asset(
//                     btmController.selectedIndex.value == 2
//                         ? Assets.cartSelected
//                         : Assets.cart,
//                   ),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 btmController.updateSelectedIndex(3);
//               },
//               child: InkResponse(
//                 child: Obx(
//                   () => SvgPicture.asset(
//                     btmController.selectedIndex.value == 3
//                         ? Assets.shopSelected
//                         : Assets.shop,
//                   ),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 btmController.updateSelectedIndex(4);
//               },
//               child: InkResponse(
//                   child: Obx(
//                 () => SvgPicture.asset(
//                   btmController.selectedIndex.value == 4
//                       ? Assets.userSelected
//                       : Assets.user,
//                 ),
//               )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
