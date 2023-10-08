import 'package:bakery_app/dummyData/ItemsData.dart';
import 'package:bakery_app/providers/CategoryItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuList extends ConsumerWidget {
  const MenuList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: ElevatedButton(
              onPressed: () {
                ref
                    .read(CategoryItemsProvider.notifier)
                    .toggleCategoryItems(Catogories[index].id);
              },
              child: Text(Catogories[index].Title),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(55),
                ),
              ),
            ),
          );
        },
        itemCount: Catogories.length,
      ),
    );
  }
}
