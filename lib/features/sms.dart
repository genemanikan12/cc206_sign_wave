import 'package:flutter/material.dart';


class sms extends StatelessWidget {
  const sms({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Aa',
                      ),
                    ),
                  ),
                  Icon(
                    Icons.send,
                    color: Colors.blue,
                    size: 40, // Adjust the size as needed
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


