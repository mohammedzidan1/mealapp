import 'package:flutter/material.dart';
import 'package:meal_app2/dummy_data.dart';
import 'package:meal_app2/models/meal.dart';
import './screens/filtires_screen.dart';
import './screens/taps_screens.dart';
import './screens/meal_deatil_screen.dart';
import 'screens/category_screen.dart';
import './screens/category_meal_Ssreens.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _avariableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _setFiltirs(Map<String, bool> filterData) {
    filters = filterData;
    _avariableMeal = DUMMY_MEALS.where((meal) {
      if (filters['gluten'] && !meal.isGlutenFree) {
        return false;
      }

      if (filters['lactose'] && !meal.isLactoseFree) {
        return false;
      }

      if (filters['vegetarian'] && !meal.isVegetarian) {
        return false;
      }

      if (filters['vegan'] && !meal.isVegan) {
        return false;
      }

      return true;
    });
  }
  void _toggleFavourit (String mealId){
    final exeistingIndex =_favoriteMeal.indexWhere((meal)=>meal.id==mealId);
    if(exeistingIndex>=0){
      setState(() {
        _favoriteMeal.removeAt(exeistingIndex);
      });
    }else{
      
      _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId));
    }

  }
  bool _isMealVavourit(String id){
    return _favoriteMeal.any((meal)=>meal.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed',
                ),
              )),
      // home: MyHomePage(),
      //  home: Category_Screen(),
      routes: {
        '/': (context) => TapsScreen(_favoriteMeal),
        // CategoryMealsScreens.routName:()
        CategoryMealsScreens.routeName: (context) =>
            CategoryMealsScreens(_avariableMeal),

        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavourit ,_isMealVavourit),
        FiltersScreen.routeName: (context) =>FiltersScreen(_setFiltirs, filters),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: null,
    );
  }
}
