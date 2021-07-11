import 'package:Meals/models/meals_model.dart';
import 'package:Meals/screens/meal_detail_screen.dart';
import 'package:Meals/screens/filters_screen.dart';
import './screens/tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/category_meals_screen.dart';
import 'dummy_datas/meal_details.dart';

void main() {
  runApp(Meals());
}

class Meals extends StatefulWidget {
  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  Map<String, bool> filter = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false
  };
  List<Meal> filteredlist = DUMMY_MEALS;

  void setfilters(Map<String, bool> filterdata) {
    print("reahed $filterdata");
    setState(() {
      filter = filterdata;
      print("reahed and changed $filter");
      filteredlist = DUMMY_MEALS.where((element) {
        if (filter["gluten"] && !element.isGlutenFree) return false;
        if (filter["lactose"] && !element.isLactoseFree) return false;
        if (filter["vegan"] && !element.isVegan) return false;
        if (filter["vegetarian"] && !element.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals",
      routes: {
        "/": (context) => Tabs(),
        "/categorymeals": (context) => CategoryMeals(filteredlist),
        "/mealdetail": (context) => MealDetail(),
        "/filters": (context) => AllFilters(filter, setfilters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => CategoryMeals(filteredlist));
      },
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: GoogleFonts.aladin(fontSize: 20, color: Colors.white),
              bodyText2: TextStyle(fontSize: 10),
            ),
        primarySwatch: Colors.amber,
        accentColor: Colors.purple,
      ),
    );
  }
}
