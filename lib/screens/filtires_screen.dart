import 'package:flutter/material.dart';
import '../widgets/maindrawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = "/filters";
  final Map<String,bool> currentFilters;
  Function savefilter;


  FiltersScreen( this.savefilter,this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {



  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;
@override
   initState(){
   _GlutenFree = widget.currentFilters['gluten'];
   _LactoseFree = widget.currentFilters['lactose'];
  _Vegan = widget.currentFilters['vegan'];
 _Vegetarian = widget.currentFilters['vegetarian'];
super.initState(

);

}
  Widget buldSwitchListTitle( String title,String subtitle,bool currentValue,Function upDateValue){
   return  SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged:upDateValue
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed:(){
              final Map <String,bool> selectedFilters ={
                'gluten':_GlutenFree ,
                'lactose': _LactoseFree,

                'vegan': _Vegan,
                'vegetarian': _Vegetarian ,
              };

              widget.savefilter(selectedFilters);
            }




          ),

      ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buldSwitchListTitle("Gluten_Free","Only include gluten_free meals.",_GlutenFree,(newValue){
                  setState(() {

                    _GlutenFree = newValue;
                  },
                  );
                }), buldSwitchListTitle(" Lactose_free","Only include lactose_free meals.",_LactoseFree,(newValue){
                  setState(() {

                    _LactoseFree = newValue;
                  },
                  );
                }),
                buldSwitchListTitle("Vegetarian_Free","Only include vegetarian_free meals.",_Vegetarian,(newValue){
                  setState(() {

                    _Vegetarian = newValue;
                  },
                  );
                }),
                buldSwitchListTitle("Vegan_Free","Only include vegan_free meals.",_Vegan,(newValue){
                  setState(() {

                    _Vegan= newValue;
                  },
                  );
                }),

              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
