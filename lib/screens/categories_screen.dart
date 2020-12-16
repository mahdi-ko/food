import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 200),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 300,
          childAspectRatio: 1.5,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (data) => CategoryItem(
                id: data.id,
                title: data.title,
                color: data.color,
              ),
            )
            .toList(),
      ),
    );
  }
}
