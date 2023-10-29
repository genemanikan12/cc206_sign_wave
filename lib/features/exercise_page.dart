import 'package:flutter/material.dart';

enum ProductTypeEnum { Option1, Option2 }

class Exercise extends StatefulWidget {
  Exercise({Key? key}) : super(key: key);

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  ProductTypeEnum? _productTypeEnum;
  double _progressValue = 0.5; // Initial progress value

  // Function to select an option when tapped
  void _selectOption(ProductTypeEnum option) {
    setState(() {
      _productTypeEnum = option;
    });
  }

  // Function to check if an option is selected
  bool _isOptionSelected(ProductTypeEnum option) {
    return _productTypeEnum == option;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Lesson 1 - Hello and Welcome')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Progress:',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
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
              padding: const EdgeInsets.only(left: 0, bottom: 15),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Lets test your knowledge!',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
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
                    height: 200,
                    width: 350,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 30, left: 15, right: 15),
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
                    height: 200,
                    width: 350,
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
                        Text('Click Me', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5.0), // Rounded rectangle
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
