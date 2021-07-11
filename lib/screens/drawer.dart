import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Draweritem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up...",
              style: GoogleFonts.aladin(fontSize: 20, color: Colors.amber),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, "/"),
            leading: Icon(
              Icons.restaurant,
              size: 40,
            ),
            title: Text(
              "Meals",
              style: TextStyle(color: Colors.amber),
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, "/filters"),
            leading: Icon(
              Icons.settings,
              size: 40,
            ),
            title: Text(
              "Fiters",
              style: TextStyle(color: Colors.amber),
            ),
          )
        ],
      ),
    );
  }
}
