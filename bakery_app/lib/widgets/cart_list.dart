import 'dart:convert';

import 'package:bakery_app/Model/bakeryItem.dart';
import 'package:bakery_app/providers/cartItems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class CartList extends ConsumerStatefulWidget {
  const CartList({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  ConsumerState<CartList> createState() => _CartListState();
}

class _CartListState extends ConsumerState<CartList> {
  List<BakeryItem> CartItems = [];
  var isLoading = true;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() async {
    final url = Uri.https(
      'bakery-app-b667d-default-rtdb.firebaseio.com',
      'cart_list.json',
    );

    final response = await http.get(
      url,
    );

    final Map<String, dynamic> listdata = json.decode(response.body);
    print(listdata);
    final List<BakeryItem> loadedItems = [];

    for (final items in listdata.entries) {
      loadedItems.add(BakeryItem(
          pid: items.value['id'],
          name: items.value['name'],
          id: items.key,
          price: int.parse(items.value['price']),
          flavore: items.value['flavour'],
          desc: '',
          ratedStar: int.parse(items.value['quantity']),
          image: items.value['image'],
          isCreamy: true,
          isChocolate: true,
          Title: ''));
    }
    setState(() {
      CartItems = loadedItems;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(25),
        itemCount: CartItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 233, 30, 155).withOpacity(0.08),
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
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: widget.height / 6 - 15,
                      width: widget.width / 4 + 10,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(CartItems[index].image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Container(
                      height: widget.height / 6 - 15,
                      width: widget.width / 2 - 18,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: widget.width / 3 - 18,
                                  child: Text(
                                    CartItems[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Flavour: ' + CartItems[index].flavore,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  CartItems[index].price.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.w200),
                                ),
                                Spacer(),
                                Container(
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
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.pink.withOpacity(0.1),
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.5),
                                    child: Text(
                                      CartItems[index].ratedStar.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    if (isLoading) content = Center(child: CircularProgressIndicator());
    return content;
  }
}
