import 'package:bakery_app/Model/bakeryItem.dart';
import 'package:bakery_app/providers/favoriteItems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteList extends ConsumerWidget {
  const FavoriteList({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<BakeryItem> FavoriteItems = ref.watch(FavoriteItemProvider);

    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(25),
        itemCount: FavoriteItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height / 6,
              width: width / 4 + 15,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: height / 6,
                      width: width / 4 + 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            offset: Offset(-5, 5),
                            spreadRadius: 4,
                            color: Colors.black.withOpacity(0.08),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height / 6 - 20,
                        width: width / 4 + 10,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(FavoriteItems[index].image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                      ),
                      Container(
                        height: height / 6,
                        width: width / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                FavoriteItems[index].name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Flavour: ' + FavoriteItems[index].flavore,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    FavoriteItems[index].price.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.pink,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Text('Buy Now'),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pink,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
