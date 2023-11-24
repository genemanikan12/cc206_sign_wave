import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vertical Scrollable Menu Example',
      theme: ThemeData.dark(), // Set the overall theme to dark
      home: LessonPage(),
    );
  }
}

class LessonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Dark background color
      appBar: AppBar(
        backgroundColor: Colors.grey[900], // Dark background color
        title: Text('Modules'), // Change the title to "Modules"
        leading: BackButton(), // Add a back button in the left corner
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: List.generate(
                  10, // Number of items in the menu
                  (index) => Lesson(index + 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Lesson extends StatelessWidget {
  final int index;

  Lesson(this.index);

  @override
  Widget build(BuildContext context) {
    Widget rightIcon;
    if (index == 1) {
      // Use big blue arrow button for Lesson 1
      rightIcon = GestureDetector(
        onTap: () {
          // Add your functionality for Lesson 1 button press
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blue, // Blue background color
            borderRadius: BorderRadius.circular(12.0), // Smooth edges
          ),
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 32.0, // Big icon size
          ),
        ),
      );
    } else {
      // Use lock icon for Lesson 2 onwards
      rightIcon = Icon(Icons.lock, color: Colors.white);
    }

    return Container(
      height: 100, // Set the height of each menu item (including icon and description)
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey[800], // Slightly darker background color
        borderRadius: BorderRadius.circular(12.0), // Smooth edges
        border: Border.all(
          color: Colors.transparent, // Invisible outline color
          width: 1.0, // Outline width
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Lesson $index',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Center(
                  child: Text(
                    'Brief description', // Replace with your actual description
                    style: TextStyle(
                      color: Colors.grey[400], // Description text color
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            rightIcon,
          ],
        ),
      ),
    );
  }
}
