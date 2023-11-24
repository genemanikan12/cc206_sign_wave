import 'package:cc206_sign_wave/components/home_drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Lessons(),
    );
  }
}

class Lessons extends StatefulWidget {
  const Lessons({Key? key}) : super(key: key);

  @override
  _LessonsState createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  int _currentIndex = 0;

  void _onBottomNavItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        print("Already on the Lesson Page");
        break;
      case 1:
        print("Navigating to ExercisePage");
        Navigator.pushNamed(context, '/exercise');
        break;
      case 2:
        print("Navigating to ChatPage");
        Navigator.pushNamed(context, '/chat');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'Modules',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: MyDrawer(),
      body: LessonPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book, color: Colors.blue),
            label: 'Lessons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center, color: Colors.blue),
            label: 'Exercises',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: Colors.blue),
            label: 'Chat',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          _onBottomNavItemTapped(index, context);
        },
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}

class LessonPage extends StatelessWidget {
  final List<String> titles = [
    'Hello and Welcome!',
    'I Understand You',
    'Can you sign?',
    'Mine or Yours?',
    'I would like to eat something',
    'The alphabet I',
    'The alphabet II',
    'The alphabet III',
    'Nice to meet you',
    'Where are you from?',
  ];

  final List<String> descriptions = [
    'Greeting people and asking them how they are doing',
    'Getting a conversation going.',
    'Useful questions and the components of a sign',
    'Get a hold on possessive pronouns',
    'Learning essential phrases in ASL',
    'Introducing letters from A to F',
    'Introducing letters from G to P',
    'Introducing letters from Q to Z',
    'Describing the objects around you',
    'Introducing ourselves and others',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: titles.length,
                itemBuilder: (context, index) => Lesson(
                  index + 1,
                  title: titles[index],
                  description: descriptions[index],
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
  final String title;
  final String description;

  Lesson(this.index, {required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    Widget rightIcon;
    if (index == 1) {
      rightIcon = GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 32.0,
          ),
        ),
      );
    } else {
      rightIcon = Icon(Icons.lock, color: Colors.white);
    }

    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.transparent,
          width: 1.0,
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
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Center(
                  child: Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey[400],
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
