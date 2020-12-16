import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:food/dummy_data.dart';
import 'package:food/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final String mealId = routeArgs['id'];
    final Color catColor = routeArgs['color'];

    final Meal selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: catColor,
        title: Text(selectedMeal.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl),
            ),
            buildSectionTitle(context, 'Ingredients'),
            Container(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.local_restaurant_rounded,
                          size: 16,
                        ),
                        Text(
                          "- ${selectedMeal.ingredients[index]}",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${index + 1}- ${selectedMeal.steps[index]}",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
