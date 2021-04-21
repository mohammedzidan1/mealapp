//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app2/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail';
  final Function toggletFavourit;
  final Function isMealFavourit;

  MealDetailScreen( this.toggletFavourit,this.isMealFavourit);
  Widget buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme
          .of(ctx)
          .textTheme
          .title,),
    );
  }

  Widget buldContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey)
          , borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,);

  }



  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute
        .of(context)
        .settings
        .arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body:SingleChildScrollView(
        child: Column(children: <Widget>[

          Container(
            width: double.infinity,
            height: 300,
            //  color: Colors.black54,
            child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,),),

          buildSectionTitle(context, 'Ingredients'),

          buldContainer(ListView.builder(itemBuilder: (ctx, index) =>
              Card(
                color: Theme
                    .of(context)
                    .accentColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              ), itemCount: selectedMeal.ingredients.length,
          ),
          ),


          buildSectionTitle(context, 'Steps'),
        buldContainer(ListView.builder(itemBuilder: (ctx, index) =>Column(children: <Widget>[
          ListTile(
            leading:CircleAvatar(
              child: Text("# ${index+1}"),
            ) ,
            title: Text(selectedMeal.steps[index]),
          ),
      Divider()  ],
        ),

          itemCount: selectedMeal.steps.length,
        ), ),

        ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>toggletFavourit(mealId) ,
        child: Icon(
            isMealFavourit(mealId)?Icons.star:Icons.star_border,

        ),
      ),
    );
  }
}
