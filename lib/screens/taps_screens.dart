import 'package:flutter/material.dart' '';
import 'package:meal_app2/models/meal.dart';
import 'package:meal_app2/screens/category_screen.dart';
import 'package:meal_app2/screens/favotitscreen.dart';
import '../widgets/maindrawer.dart';
class TapsScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;

 TapsScreen( this.favouriteMeal) ;
  @override
  _TapsScreenState createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {

   List<Map<String, Object>> _pages;
  int _selectedPageIndix=0;
  void _selectPage(int value) {
    setState(() {
      _selectedPageIndix=value;
    });
  }
  @override
  void initState() {
   _pages =[
     {
       'page': Category_Screen(),
       'title':'categories',
     },
     {
       'page':FavoritesScreen(widget.favouriteMeal),
       'title' : ' Your Favorites',
     }];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text(_pages[_selectedPageIndix]['title']),
),
      body: _pages[_selectedPageIndix]['page'],
      bottomNavigationBar:  BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor:Theme.of(context).accentColor ,
        unselectedItemColor:Colors.white ,
        currentIndex: _selectedPageIndix,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),  BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorite"),


          )
        ],
      ),
      drawer:MainDrawer() ,

    );
  }


}

   
