import 'package:flutter/material.dart';
import 'package:the_cafe/screens/Detail%20Screen/widgets/detail_text.dart';
import 'package:the_cafe/screens/Detail%20Screen/widgets/detail_top_image.dart';
import 'package:the_cafe/screens/Detail%20Screen/widgets/location_bar.dart';
import 'package:the_cafe/screens/Detail%20Screen/widgets/title_bar.dart';
import 'package:the_cafe/size_config.dart';
import 'package:the_cafe/widgets/defaultbutton.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {super.key, required this.titleText, required this.imageURL});

  final String titleText;
  final String imageURL;

  //static String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          DetailTopImage(ImageURL: imageURL),
          SingleChildScrollView(
            //scrollDirection: Axis.vertical,
            child: Column(
              children: [
                TitleBar(title: titleText),
                LocationBar(),
                detailText(),
                defaultButton(
                  text: 'Book Now',
                  press: () {},
                  width: getProportionateScreenWidth(100),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
