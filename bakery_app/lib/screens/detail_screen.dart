import 'dart:convert';
import 'dart:developer';

import 'package:bakery_app/providers/cartItems.dart';
import 'package:bakery_app/providers/quantity.dart';
//import 'package:bakery_app/providers/favoriteItems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../Model/bakeryItem.dart';
import '../providers/favoriteItems.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key, required this.item});

  final BakeryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int Val = 1;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List<BakeryItem> FavoriteItems = ref.watch(FavoriteItemProvider);
    final CartItems = ref.watch(CartItemProvider);

    bool checkVal(dynamic item, List<Map<String, dynamic>> CartItems) {
      for (var element in CartItems) {
        if (element.containsValue(item)) return true;
      }
      return false;
    }

    bool IsInCart = checkVal(item, CartItems);

    void updateCart() async {
      ref.read(CartItemProvider.notifier).updateCart(Val, item);

      try {
        final url = Uri.https(
          'bakery-app-b667d-default-rtdb.firebaseio.com',
          'cart_list.json',
        );
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'id': item.id,
            'name': item.name,
            'price': item.price.toString(),
            'flavour': item.flavore,
            'image': item.image,
            'quantity': Val.toString()
          }),
        );
        log(url.toString());
        if (!context.mounted) return;

        if (response.statusCode == 200) {
          // Successfully posted data
          log(response.body);
          // Handle the response as needed
        } else {
          // Handle other status codes if needed
          throw Exception(
              'HTTP request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        // Handle the exception
        log('An error occurred: $e');
      }
    }

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 36),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.transparent),
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 40,
              right: -40,
              child: Container(
                height: height,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: item.image,
                      child: Container(
                        height: height / 2,
                        width: width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              item.image,
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 22),
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(FavoriteItemProvider.notifier)
                                    .updateFavorite(item);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  FavoriteItems.contains(item)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 22,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.pink,
                                shape: CircleBorder(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(item.name),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 1; i <= item.ratedStar; i++)
                            Icon(
                              Icons.star,
                              color: const Color.fromARGB(255, 192, 117, 4),
                            ),
                          if (item.ratedStar < 5)
                            Row(
                              children: [
                                for (int i = item.ratedStar; i <= 5; i++)
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                  ),
                              ],
                            ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            item.ratedStar.toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Val--;
                              if (Val < 0) return;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.pink.withOpacity(0.1),
                                  shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  CupertinoIcons.minus,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle),
                            child: Text(
                              Val.toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Val++;
                              ref
                                  .read(quantityProvider.notifier)
                                  .updateQuantity(Val);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.pink.withOpacity(0.1),
                                  shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  CupertinoIcons.plus,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 45,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 18, top: 2),
                            child: Text(item.desc),
                          )),
                    )),
                    Container(
                      height: height / 10,
                      width: width,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 30, 155)
                            .withOpacity(0.08),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: updateCart,
                            child: Padding(
                              padding: const EdgeInsets.all(18),
                              child: Text(
                                IsInCart ? 'Remove from Cart' : 'Add to Cart',
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 60),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  '250.40',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
