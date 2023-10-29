import 'dart:convert';

import 'package:bakery_app/Model/bakeryItem.dart';
import 'package:bakery_app/providers/CategoryItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../providers/favoriteItems.dart';
import '../screens/detail_screen.dart';

class ItemsList extends ConsumerStatefulWidget {
  const ItemsList({
    super.key,
  });

  @override
  ConsumerState<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends ConsumerState<ItemsList> {
  List<BakeryItem> cartItems = [];
  void checkCartItems() async {
    final url = Uri.https(
      'bakery-app-b667d-default-rtdb.firebaseio.com',
      'cart_list.json',
    );

    final response = await http.get(
      url,
    );

    final Map<String, dynamic>? listdata = json.decode(response.body);
    print(listdata);
    final List<BakeryItem> loadedItems = [];
    if (listdata != null) {
      for (final items in listdata.entries) {
        loadedItems.add(BakeryItem(
            pid: items.value['id'],
            name: items.value['name'],
            id: items.key,
            price: int.parse(items.value['price']),
            flavore: items.value['flavour'],
            desc: '',
            ratedStar: items.value['quantity'],
            image: items.value['image'],
            isCreamy: true,
            isChocolate: true,
            Title: ''));
      }

      setState(() {
        cartItems = loadedItems;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<BakeryItem> categoryItems = ref.watch(CategoryItemsProvider);
    List<BakeryItem> FavoriteItems = ref.watch(FavoriteItemProvider);

    return Container(
      height: 300,
      child: ListView.builder(
        padding: EdgeInsets.only(right: 30),
        scrollDirection: Axis.horizontal,
        itemCount: categoryItems.length,
        itemBuilder: (context, index) {
          return Container(
            height: 300,
            width: 220,
            child: Stack(
              children: [
                Positioned(
                  top: 55,
                  left: 20,
                  right: 0,
                  bottom: 15,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailScreen(
                                item: categoryItems[index],
                                cartItems: cartItems);
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 160,
                      width: 220,
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
                          ]),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 30,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailScreen(
                              item: categoryItems[index],
                              cartItems: cartItems,
                            );
                          },
                        ),
                      );
                    },
                    child: Hero(
                      tag: categoryItems[index].image,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailScreen(
                                  item: categoryItems[index],
                                  cartItems: cartItems,
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: 300,
                          width: 240,
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 180,
                                alignment: Alignment.topRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    ref
                                        .read(FavoriteItemProvider.notifier)
                                        .updateFavorite(categoryItems[index]);
                                  },
                                  child: Icon(
                                    FavoriteItems.contains(categoryItems[index])
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.pink,
                                  ),
                                  style: IconButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: CircleBorder()),
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          categoryItems[index].image),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(18),
                                    bottomLeft: Radius.circular(18),
                                    topRight: Radius.circular(18),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 120,
                                width: 180,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Text(
                                        categoryItems[index].name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Text(
                                        'Flavour: ' +
                                            categoryItems[index].flavore,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Rs ' +
                                                (categoryItems[index].price)
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.pink),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: Text('Buy Now'),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.pink,
                                                foregroundColor: Colors.white,
                                                shape:
                                                    ContinuousRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(60),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
