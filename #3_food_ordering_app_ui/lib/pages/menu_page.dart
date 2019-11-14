import 'package:flutter/material.dart';
import 'package:food_ordering_app_ui/components/food_item_card.dart';
import 'package:food_ordering_app_ui/pages/food_item_page.dart';
import 'package:food_ordering_app_ui/providers/food_items_provider.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(fontSize: 15,),
              prefixIcon: Icon(Icons.search, size: 20,),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 36,),
            padding: EdgeInsets.only(left: 16, right: 16, top: 16,),
            decoration: BoxDecoration(
              color: Color(0xffB9D7D5),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(36,),),
            ),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              children: FoodItemsProvider.items.map((item) {
                return GestureDetector(
                  child: FoodItemCard(
                    imageUrl: item.imageUrl,
                    itemName: item.itemName,
                    estimatedTime: item.estimatedTime,
                    rating: item.rating,
                    price: item.price,
                  ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FoodItemPage(foodItem: item,))),
                );
              }).toList(),
              physics: ClampingScrollPhysics(),
            ),
          ),
        ),
      ],
    );
  }
}
