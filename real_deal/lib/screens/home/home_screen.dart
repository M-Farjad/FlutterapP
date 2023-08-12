import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../values/category_list.dart';
import '../../values/custom_colors.dart';
import '../../widgets/background_shape.dart';
import '../../controllers/image_controller.dart';
import '../../values/assets.dart';
import '../../values/spacing.dart';
import '../../values/strings.dart';
import '../../values/styles.dart';
import '../../widgets/real_deal.dart';
import '../../widgets/search_field.dart';
import '../category/widgets/catalog_products.dart';
import 'widgets/category.dart';
import 'widgets/deal_indicators.dart';
import 'widgets/deal_offers.dart';
import 'widgets/drawer.dart';
import 'widgets/location_row.dart';
import 'widgets/see_more_row.dart';
import 'widgets/whatsapp_dialog.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _prefs = Get.find<SharedPreferences>();
  RxBool showModal = true.obs;
  final ImageController imageController = Get.put(ImageController());
  final PageController _pageController =
      PageController(viewportFraction: .85); // To control the page view
  // final LoginController controller = Get.find<LoginController>();

  void _initSharedPreferences() {
    // showModal.value = true;
    showModal.value = _prefs.getBool('showModal') ?? true;

    if (showModal.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Show the modal using GetX's dialog
        Get.dialog(
          WhatsappAlertDialog(prefs: _prefs, showModal: showModal),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _initSharedPreferences();
    return Scaffold(
      drawer: CustomDrawer(),
      // appBar: customAppBar(),
      drawerScrimColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const HomeBackgroundShape(),
            SafeArea(
              child: Column(
                children: [
                  DealRealSmallTitle(color: CustomColors.white),
                  Container(
                    color: CustomColors.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: Get.height * .01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            icon: SvgPicture.asset(Assets.jamMenu),
                            onPressed: () {
                              Scaffold.of(context)
                                  .openDrawer(); // Open the drawer
                            },
                          ),
                        ),
                        SearchField(color: CustomColors.white),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(Assets.notificationBell),
                        )
                      ],
                    ),
                  ),
                  Spacing.vertical(.01),
                  LocationRow(),
                  Spacing.vertical(.01),
                  //!offer
                  DealOffers(
                      pageController: _pageController,
                      category: category,
                      imageController: imageController),
                  Spacing.vertical(.01),
                  //!dots:
                  DealIndicators(
                      category: category, imageController: imageController),
                  Spacing.vertical(.01),
                  Container(
                    padding: EdgeInsets.only(left: Get.width * .06),
                    width: double.infinity,
                    child: Text(
                      Strings.categories,
                      style: Styles.regularInter18(
                        CustomColors.normalTextColor,
                        fontWeight: FontWeight.w600,
                        letterSpacing: .3,
                      ),
                    ),
                  ),
                  Spacing.vertical(.02),
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                      // shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: category.length,
                      itemBuilder: (_, int index) {
                        return CategoryWidget(
                          title: category[index].title,
                          image: category[index].imagePath,
                        );
                      },
                    ),
                  ),
                  Divider(color: CustomColors.grey),
                  SeeMoreRow(title: Strings.specialDeal),
                  const CatalogProductsList(),
                  SeeMoreRow(title: Strings.popularProducts),
                  const CatalogProductsList(),
                  SeeMoreRow(title: Strings.mostSellingProducts),
                  const CatalogProductsList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
