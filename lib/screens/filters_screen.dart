import 'package:flutter/material.dart';

class AllFilters extends StatefulWidget {
  final filters;
  final setfilters;
  AllFilters(this.filters, this.setfilters);
  @override
  _AllFiltersState createState() => _AllFiltersState();
}

class _AllFiltersState extends State<AllFilters> {
  Widget switchtilebuild(
      String title, String subtitle, free, Function setfunction) {
    print(free);
    return SwitchListTile(
      value: free,
      onChanged: setfunction,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final Map<String, bool> selectedfilter = {
                  "gluten": widget.filters["gluten"],
                  "vegetarian": widget.filters["vegetarian"],
                  "vegan": widget.filters["vegan"],
                  "lactose": widget.filters["lactose"],
                };

                widget.setfilters(selectedfilter);
              })
        ],
        title: Text("Your Filters"),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(13),
              child: Text("Adjust your Meal Selection",
                  style: TextStyle(color: Colors.black, fontSize: 15))),
          Expanded(
              child: ListView(
            children: [
              switchtilebuild("Glutenfree", "Only include Glutenfree Meal",
                  widget.filters["gluten"], (newval) {
                setState(() {
                  widget.filters["gluten"] = newval;
                });
              }),
              switchtilebuild("vegetarian", "Only include vegetarian Meal",
                  widget.filters["vegetarian"], (newval) {
                setState(() {
                  widget.filters["vegetarian"] = newval;
                });
              }),
              switchtilebuild(
                  "vegan", "Only include vegan Meal", widget.filters["vegan"],
                  (newval) {
                setState(() {
                  widget.filters["vegan"] = newval;
                });
              }),
              switchtilebuild("lactosefree", "Only include lactosefree Meal",
                  widget.filters["lactose"], (newval) {
                setState(() {
                  widget.filters["lactose"] = newval;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
