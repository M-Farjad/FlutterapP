import 'dart:convert';
import 'dart:developer';

//import 'package:bakery_app/providers/favoriteItems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../Model/bakeryItem.dart';
import '../providers/favoriteItems.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({
    super.key,
    required this.item,
    required this.cartItems,
  });

  final BakeryItem item;
  final List<BakeryItem> cartItems;
  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  int Val = 1;
  int Itemindex = 0;
  bool IsInCart = false;

  List<BakeryItem> CartItems = [];
  @override
  void initState() {
    super.initState();
    IsInCart = widget.cartItems.any(
      (element) => element.id == widget.item.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    void updateCart() async {
      try {
        log(IsInCart.toString());
        if (!IsInCart) {
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
              'id': widget.item.id,
              'name': widget.item.name,
              'price': widget.item.price.toString(),
              'flavour': widget.item.flavore,
              'image': widget.item.image,
              'quantity': Val,
            }),
          );
          if (!context.mounted) return;
          if (response.statusCode == 200) {
            // Successfully posted data
            log('${response.body} Item added successfully.');
            setState(() {
              IsInCart = true;
            });
            // Handle the response as needed
          } else {
            // Handle other status codes if needed
            throw Exception(
                'HTTP request failed with status: ${response.statusCode}');
          }
        } else if (IsInCart) {
          final url = Uri.https(
            'bakery-app-b667d-default-rtdb.firebaseio.com',
            'cart_list/${CartItems[Itemindex].id}.json',
          );
          final response = await http.delete(
            url,
            headers: {
              'Content-Type': 'application/json',
            },
          );

          if (response.statusCode == 200) {
            // Successfully deleted the item.
            log(response.body);
            log('Item deleted successfully.');
            setState(() {
              IsInCart = false;
            });
          } else {
            // Handle the error or non-200 response here.
            log('Failed to delete item. Status code: ${response.statusCode}');
          }
        }
      } catch (e) {
        // Handle the exception
        log('An error occurred: $e');
      }
    }

    List<BakeryItem> FavoriteItems = ref.watch(FavoriteItemProvider);

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
                      tag: widget.item.image,
                      child: Container(
                        height: height / 2,
                        width: width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              widget.item.image,
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
                                    .updateFavorite(widget.item);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  FavoriteItems.contains(widget.item)
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
                    Text(widget.item.name),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 1; i <= widget.item.ratedStar; i++)
                            Icon(
                              Icons.star,
                              color: const Color.fromARGB(255, 192, 117, 4),
                            ),
                          if (widget.item.ratedStar < 5)
                            Row(
                              children: [
                                for (int i = widget.item.ratedStar + 1;
                                    i <= 5;
                                    i++)
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
                            widget.item.ratedStar.toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (Val > 1) {
                                  Val--;
                                }
                              });
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
                              setState(() {
                                Val++;
                              });
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
                            child: Text(widget.item.desc),
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
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Rs: 250.40',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
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
