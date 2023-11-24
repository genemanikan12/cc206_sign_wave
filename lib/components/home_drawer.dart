import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[850], // Set the background color here
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[900],
              ),
              child: Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            buildListTile(context, 'Lessons', '/lessons'),
            buildListTile(context, 'Exercises', '/exercise'),
            buildListTile(context, 'Chat', '/chat'),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(BuildContext context, String title, String route) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: ModalRoute.of(context)?.settings.name == route
                ? Colors.blue // Change color if selected
                : Colors.white, // Change to white for contrast
          ),
        ),
        onTap: () {
          Navigator.pop(context); // Close the drawer
          Navigator.pushReplacementNamed(context, route);
        },
      ),
    );
  }
}
