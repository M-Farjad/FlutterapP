import 'package:flutter/material.dart';

class BakeryItem extends StatelessWidget {
  const BakeryItem({
    super.key,
    required this.name,
    required this.id,
    required this.price,
    required this.flavore,
    required this.desc,
    required this.ratedStar,
    required this.image,
    required this.isCreamy,
    required this.isChocolate,
    required this.Title,
    required this.pid,
  });

  final String pid;
  final String name;
  final String id;
  final int price;
  final String flavore;
  final String desc;
  final int ratedStar;
  final String image;
  final bool isCreamy;
  final bool isChocolate;
  final String Title;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
