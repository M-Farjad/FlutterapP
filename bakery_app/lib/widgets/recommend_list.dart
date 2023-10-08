import 'package:bakery_app/dummyData/ItemsData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/bakeryItem.dart';
import '../providers/CategoryItems.dart';
import '../providers/bakeryItems.dart';
import '../screens/detail_screen.dart';

class RecommendList extends ConsumerStatefulWidget {
  const RecommendList({
    super.key,
  });

  @override
  ConsumerState<RecommendList> createState() => _RecommendListState();
}

class _RecommendListState extends ConsumerState<RecommendList> {
  @override
  Widget build(BuildContext context) {
    List<BakeryItem> categoryItems = ref.watch(CategoryItemsProvider);
    return Container(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              width: 200,
              height: 85,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    bottom: 15,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailScreen(
                                item: categoryItems[index],
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: 70,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
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
                  ),
                  Positioned(
                    top: 0,
                    bottom: 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailScreen(
                                item: categoryItems[index],
                              );
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 90,
                            width: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(categoryItems[index].image),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                categoryItems[index].name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Flavour: ' + categoryItems[index].flavore,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              Text(
                                'Rs ' + categoryItems[index].price.toString(),
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.w200),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Buy Now'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pink,
                                  foregroundColor: Colors.white,
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(60),
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
            ),
          );
        },
      ),
    );
  }
}
