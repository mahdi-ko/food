import 'package:flutter/material.dart';

import 'package:food/models/meal.dart';
import 'package:food/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Color color;
  final Function removeItem;

  const MealItem({
    Key key,
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    this.color = Colors.pink,
    @required this.removeItem,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'i don\'t know';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Cheap:
        return 'Cheap';
        break;
      case Affordability.Expensive:
        return 'Expensive';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'i don\'t know';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: {
      'id': id,
      'color': color,
    }).then((result) {
      if (result != null) removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 100,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                Positioned(
                  bottom: 25,
                  right: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    color: Colors.black45,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(width: 6),
                    Text(
                      '$duration min',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  Row(children: <Widget>[
                    Icon(Icons.architecture),
                    SizedBox(width: 6),
                    Text(
                      complexityText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  Row(children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(width: 6),
                    Text(
                      affordabilityText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
