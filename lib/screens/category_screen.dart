import 'package:flutter/material.dart';
import '../widgets/category_Item.dart';

import '../dummy_data.dart';

class  Category_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      GridView(
        padding: EdgeInsets.all(25),

        children: DUMMY_CATEGORIES.map((catDeta) =>
        CategoryItem(catDeta.id,catDeta.title,catDeta.color),
        ).toList(),

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
         ),
    );
  }
}
