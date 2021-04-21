import 'package:flutter/material.dart';
import 'package:meal_app2/screens/filtires_screen.dart';
class MainDrawer extends StatelessWidget {
  Widget buldlisttile(String title,IconData icon,Function tapHndral){
    return  ListTile(
      leading: Icon(icon,size: 26,),
      title: Text(title,style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        fontFamily: "RobotoCondensed",

      ),),
      onTap: tapHndral,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
          //  margin: EdgeInsets.only(top: 10),
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,

            child:Text("Cocking Up!",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).primaryColor,
            )) ,
          ),
          SizedBox(height: 20,),
          buldlisttile("Meal",Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          buldlisttile("Filters",Icons.settings,(){Navigator.of(context).pushReplacementNamed( FiltersScreen.routeName);}),

        ],
      ),
    );
  }
}
