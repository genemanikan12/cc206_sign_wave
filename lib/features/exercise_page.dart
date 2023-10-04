import 'package:flutter/material.dart';

enum ProductTypeEnum { Option1, Option2 }

class exercise extends StatelessWidget {
  exercise({super.key});
  ProductTypeEnum? _productTypeEnum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.network(
              'https://st4.depositphotos.com/1010613/22025/i/450/depositphotos_220253218-stock-photo-close-woman-hands-using-sign.jpg',
              height: 400,
              width: 400,
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Image.network(
              'https://st4.depositphotos.com/1010613/21960/i/450/depositphotos_219609530-stock-photo-close-woman-hands-using-sign.jpg',
              height: 400,
              width: 400,
              fit: BoxFit.contain,
            ),
          ),
          RadioListTile<ProductTypeEnum>(
              value: ProductTypeEnum.Option1,
              groupValue: _productTypeEnum,
              title: Text(ProductTypeEnum.Option1.name),
              onChanged: (val) => _productTypeEnum = val),
          RadioListTile<ProductTypeEnum>(
            value: ProductTypeEnum.Option2,
            groupValue: _productTypeEnum,
            title: Text(ProductTypeEnum.Option2.name),
            onChanged: (val) {
              setState(() {
                _productTypeEnum = val;
              });
            },
          ),
          TextButton(
            onPressed: () {
              //Act when the button is pressed
            },
            child: Text(
              'Click Me',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

void setState(Null Function() param0) {}
