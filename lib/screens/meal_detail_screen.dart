import 'package:Meals/dummy_datas/meal_details.dart';
import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context).settings.arguments;
    print(item);
    final itemdetail = DUMMY_MEALS.firstWhere((element) => element.id == item);
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            itemdetail.title,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child: Image.network(
                itemdetail.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Column(
                children: [
                  Card(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Text(
                        "Ingredients",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.amber)),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 200,
                    child: ListView.builder(
                        itemCount: itemdetail.ingredients.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text("${index + 1}"),
                            ),
                            title: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "${itemdetail.ingredients[index]}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        }),
                  ),
                  Card(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Text(
                        "Steps",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.amber)),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 200,
                      child: ListView.builder(
                          itemCount: itemdetail.steps.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                child: Text("#${index + 1}"),
                              ),
                              title: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "${itemdetail.steps[index]}",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            );
                          }))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
