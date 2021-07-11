import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final item;

  MealItem(this.item);

  void selectmeal(context) {
    Navigator.pushNamed(context, "/mealdetail", arguments: item.id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.amber,
        onTap: () {
          selectmeal(context);
        },
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      item.imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      right: 20,
                      bottom: 20,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: 200,
                        color: Colors.black54,
                        child: Text(
                          item.title,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Icon(Icons.access_alarms),
                      Text("${item.duration}"),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.account_balance_wallet),
                        Text("${(item.affordability).toString().substring(
                              14,
                            )}")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.beach_access),
                        Text("${(item.complexity).toString().substring(
                              11,
                            )}")
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
