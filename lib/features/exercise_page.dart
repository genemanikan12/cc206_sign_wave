import 'package:flutter/material.dart';
import 'package:cc206_sign_wave/components/home_drawer.dart';

enum ProductTypeEnum { Option1, Option2 }

class Exercise extends StatefulWidget {
  Exercise({Key? key}) : super(key: key);

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  ProductTypeEnum? _productTypeEnum;
  double _progressValue = 0.5;

  void _selectOption(ProductTypeEnum option) {
    setState(() {
      _productTypeEnum = option;
    });
  }

  bool _isOptionSelected(ProductTypeEnum option) {
    return _productTypeEnum == option;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
          child: Text(
            'Lesson 1 - Hello and Welcome',
            style: TextStyle(color: Colors.white, fontFamily: 'Lato'),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: MyDrawer(),
      backgroundColor: Colors.grey[850],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Progress:',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontFamily: 'Lato',
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 25),
            child: LinearProgressIndicator(
              value: _progressValue,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 0, bottom: 0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Lets test your knowledge!',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 0, top: 25, bottom: 25),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Choose the sign of WELCOME!',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Lato',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
            child: InkWell(
              onTap: () => _selectOption(ProductTypeEnum.Option1),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: _isOptionSelected(ProductTypeEnum.Option1)
                        ? Colors.blue
                        : Colors.transparent,
                    width: 5.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Image.network(
                    'https://st4.depositphotos.com/1010613/22025/i/450/depositphotos_220253218-stock-photo-close-woman-hands-using-sign.jpg',
                    height: 150,
                    width: 280,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 25, left: 15, right: 15),
            child: InkWell(
              onTap: () => _selectOption(ProductTypeEnum.Option2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: _isOptionSelected(ProductTypeEnum.Option2)
                        ? Colors.blue
                        : Colors.transparent,
                    width: 5.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Image.network(
                    'https://st4.depositphotos.com/1010613/21960/i/450/depositphotos_219609530-stock-photo-close-woman-hands-using-sign.jpg',
                    height: 150,
                    width: 280,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 50, top: 15, left: 50, bottom: 25),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_productTypeEnum != null) {
                        print("Selected option: $_productTypeEnum");
                      } else {
                        print("Please select an option.");
                      }
                    },
                    child: Row(
                      children: [
                        Text('NEXT',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Lato')),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: DefaultTextStyle(
        style: TextStyle(
          fontFamily: 'Lato',
        ),
        child: BottomNavigationBar(
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
          currentIndex: 1,
          onTap: (index) => _onBottomNavItemTapped(index, context),
          backgroundColor: Colors.grey[900],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
        ),
      ),
    );
  }

  void _onBottomNavItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/lessons');
        break;
      case 1:
        print("Already on the Exercise Page");
        break;
      case 2:
        Navigator.pushNamed(context, '/chat');
        break;
    }
  }
}
