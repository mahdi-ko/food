import 'package:flutter/material.dart';
import 'package:food/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildDrawerListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: FittedBox(
              child: Text(
                'Foods Around The Globe!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildDrawerListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildDrawerListTile(
            'Filters',
            Icons.no_food,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
