import 'package:flutter/cupertino.dart';
import '../dummy_datas/dummy.dart';
import 'package:flutter/material.dart';

class MealsCatogary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400, childAspectRatio: 3 / 2),
      children: DUMMY_CATEGORIES.map((e) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/categorymeals",
                arguments: {"id": e.id}),
            child: Container(
              decoration: BoxDecoration(
                color: e.color,
                borderRadius: BorderRadius.circular(60),
              ),
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              child: Center(
                child: Text(
                  e.title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
