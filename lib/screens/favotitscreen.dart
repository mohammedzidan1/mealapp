import 'package:flutter/material.dart';
import 'package:meal_app2/models/meal.dart';
import 'package:meal_app2/widgets/meal_item.dart';
 class FavoritesScreen extends StatelessWidget {
   final List<Meal> favouriteMeal;

   FavoritesScreen( this.favouriteMeal) ;
  @override
  Widget build(BuildContext context) {

    if(favouriteMeal.isEmpty){
      return Center(
        child: Text("You have no favorites yet _ start adding some!"),
      );
    }else{
      return ListView.builder(itemBuilder:
          (ctx,index){
       return MealItem(
          id:  favouriteMeal[index].id,
          imageurl:  favouriteMeal[index].imageUrl,
          duration:  favouriteMeal[index].duration,
          title:  favouriteMeal[index].title,
          complexity:  favouriteMeal[index].complexity,
          affordability:  favouriteMeal[index].affordability,
         // removeItem : _removeMeal

        );
      },
        itemCount:favouriteMeal.length);
    }

        }




  }

