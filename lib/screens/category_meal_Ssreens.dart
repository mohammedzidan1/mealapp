import 'package:flutter/material.dart';
import 'package:meal_app2/models/meal.dart';
//import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class  CategoryMealsScreens extends StatefulWidget {


  static const routeName = 'category_meals';
  final List  <Meal> avariableMealNew;

  CategoryMealsScreens( this.avariableMealNew);

  @override
  _CategoryMealsScreensState createState() => _CategoryMealsScreensState();
}

class _CategoryMealsScreensState extends State<  CategoryMealsScreens> {
  String  categoryTitle;
  List <Meal> displyedMeal;
  @override
  void didChangeDependencies() {
    final routArg = ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routArg['id'];
    categoryTitle = routArg['title'];
    displyedMeal = widget.avariableMealNew.where((meal){

      return meal.categories.contains(categoryId);}).toList();
    super.didChangeDependencies();
  }


  void _removeMeal(String mealId){
setState(() {
  displyedMeal.removeWhere((meal)=> meal.id ==mealId);
});
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder:
      (ctx,index){
        return MealItem(
            id:  displyedMeal[index].id,
          imageurl:  displyedMeal[index].imageUrl,
          duration:  displyedMeal[index].duration,
          title:  displyedMeal[index].title,
          complexity:  displyedMeal[index].complexity,
          affordability:  displyedMeal[index].affordability,
        //  removeItem : _removeMeal,

        );
      },
      itemCount:  displyedMeal.length,),
      //ListView.builder(itemBuilder: null
      //       itemCount: ,
    );
  }
}
