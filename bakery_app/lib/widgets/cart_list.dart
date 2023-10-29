import 'dart:convert';

import 'package:bakery_app/Model/bakeryItem.dart';
import 'package:bakery_app/providers/cartItems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/total_calculate.dart';
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
  List<int> updatedRatedStarValue = [];
  double totalPrice = 0;

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

    final Map<String, dynamic>? listdata = json.decode(response.body);
    print(listdata);
    final List<BakeryItem> loadedItems = [];
    if (listdata != null) {
      for (final items in listdata!.entries) {
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
        CartItems = loadedItems;
        for (final elements in CartItems) {
          updatedRatedStarValue.add(elements.ratedStar);
          totalPrice += elements.price;
        }
        isLoading = false;
      });
    }
  }

  void increaseQuantity(int index) async {
    final url = Uri.https(
      'bakery-app-b667d-default-rtdb.firebaseio.com',
      'cart_list/${CartItems[index].id}.json',
    );

    // Define the updated ratedStar value
    if (updatedRatedStarValue[index] > 0) {
      updatedRatedStarValue[index]++;
    }
    // Change this value to the new rating

    // Create a JSON payload with the updated data
    final updatedData = {
      'quantity': updatedRatedStarValue[index],
    };

    final response = await http.patch(
      url,
      body: json.encode(updatedData),
    );

    if (response.statusCode == 200) {
      // The update was successful
      print('RatedStar updated successfully.');
      print(response.body);
      setState(() {
        updatedRatedStarValue.removeAt(index);
        isLoading = false;
        totalPrice += (updatedRatedStarValue[index] * CartItems[index].price);
      });
    } else {
      // Handle the case where the update failed
      print('Failed to update RatedStar.');
    }
  }

  void decreaseQuantity(int index) async {
    final url = Uri.https(
      'bakery-app-b667d-default-rtdb.firebaseio.com',
      'cart_list/${CartItems[index].id}.json',
    );

    // Define the updated ratedStar value
    if (updatedRatedStarValue[index] > 1) {
      updatedRatedStarValue[index]--;
    }
    // Change this value to the new rating

    // Create a JSON payload with the updated data
    final updatedData = {
      'quantity': updatedRatedStarValue[index],
    };

    final response = await http.patch(
      url,
      body: json.encode(updatedData),
    );

    if (response.statusCode == 200) {
      // The update was successful
      print('RatedStar updated successfully.');
      print(response.body);
      setState(() {
        isLoading = false;
        totalPrice -= (updatedRatedStarValue[index] * CartItems[index].price);
      });
    } else {
      // Handle the case where the update failed
      print('Failed to update RatedStar.');
    }
  }

  void deleteItem(int index) async {
    final url = Uri.https(
      'bakery-app-b667d-default-rtdb.firebaseio.com',
      'cart_list/${CartItems[index].id}.json',
    );

    final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // Successfully deleted the item.
      print(response.body);
      print('Item deleted successfully.');
      setState(() {
        CartItems = [];
        loadItems();
      });
    } else {
      // Handle the error or non-200 response here.
      print('Failed to delete item. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Widget content = Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(25),
            itemCount: CartItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 233, 30, 155)
                        .withOpacity(0.08),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      onPressed: () {
                                        deleteItem(index);
                                      },
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
                                      'Rs ' + CartItems[index].price.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.pink,
                                          fontWeight: FontWeight.w200),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        decreaseQuantity(index);
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
                                          color: Colors.pink.withOpacity(0.1),
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.5),
                                        child: Text(
                                          updatedRatedStarValue[index]
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        increaseQuantity(index);
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
        ),
        TotalCalculate(height: height, width: width),
      ],
    );
    if (isLoading) content = Center(child: CircularProgressIndicator());
    return content;
  }
}
