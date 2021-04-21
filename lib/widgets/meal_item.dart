//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app2/models/meal.dart';
import '../screens/meal_deatil_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageurl;
  final int duration;
  final Complexity complexity;

  final Affordability affordability;
  final String title;
 // final Function removeItem;


  const MealItem({@required this.id, @required this.imageurl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    this.title,
    //@required this.removeItem
  } );

 // String get compelxtytext
  compelxtytext(Complexity complexity)  {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
        break;

      case Complexity.Challenging:
        return 'Challenging';

        break;
      case Complexity.Hard:
        return 'Hard';

        break;
      default:
        return 'UnKnown';
    }
  }

  String get affordabilitytext {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;

      case Affordability.Pricey:
        return 'Pricey';

        break;
      case Affordability.Luxurious:
        return 'Luxurious';

        break;
      default:
        return 'UnKnown';
    }
  }

  void selectmeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,

        arguments: id).then((result){
//if(result!=null) removeItem(result);

    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectmeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageurl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                        width: 300,
                        color: Colors.black54,
                        padding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 26, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text("$compelxtytext"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text("$affordabilitytext"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
