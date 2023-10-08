import 'package:flutter/material.dart';
import 'package:the_cafe/constants.dart';
import 'package:the_cafe/screens/Detail%20Screen/detail_screen.dart';
import 'package:the_cafe/size_config.dart';

class ItemListData extends StatelessWidget {
  const ItemListData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> PlacesList = [
      'THE CAFE',
      'OFFICE',
    ];

    List<String> ImageList = [
      'assets/Rectangle 16.png',
      'assets/Rectangle 18.png',
    ];

    return Expanded(
      child: ListView.builder(
          itemCount: ImageList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                height: getProportionateScreenHeight(280),
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 6,
                      right: 6,
                      top: 6,
                      bottom: 6,
                      child: Image.asset(
                        ImageList[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: 12,
                      right: 12,
                      bottom: 20,
                      child: Container(
                        width: SizeConfig.screenWidth,
                        height: getProportionateScreenHeight(100),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(141, 0, 0, 0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      PlacesList[index],
                                      style: TextStyle(
                                        color: onPrimaryColor,
                                        fontSize: getProportionateScreenWidth(
                                          22,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '\$500',
                                      style: TextStyle(
                                        color: onPrimaryColor,
                                        fontSize: getProportionateScreenWidth(
                                          18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image.asset('assets/Group 9.png'),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Shop no#1, AI-Saif Plaza, Islamabad, Pakistan',
                                        style: TextStyle(
                                            color: onPrimaryColor,
                                            fontSize: 11),
                                      ),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(5),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return DetailScreen(
                                              titleText: PlacesList[index],
                                              imageURL: ImageList[index]);
                                        }));
                                      },
                                      child: Text(
                                        'View Details',
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
