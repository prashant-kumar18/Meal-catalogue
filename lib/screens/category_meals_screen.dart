import 'package:Meals/meal_item.dart';
import 'package:Meals/models/meals_model.dart';
import 'package:flutter/material.dart';

class CategoryMeals extends StatefulWidget {
  final List<Meal> availablemeals;
  CategoryMeals(this.availablemeals);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  @override
  Widget build(BuildContext context) {
    var routes =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    var id = routes["id"];

    var selectedmeals = widget.availablemeals
        .where((element) => element.categories.contains(id))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(selectedmeals[index]);
          },
          itemCount: selectedmeals.length,
        ));
  }
}
