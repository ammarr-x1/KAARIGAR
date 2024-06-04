import 'package:flutter/material.dart';
import 'package:final_project/MyScreens/BookingPage.dart';

class NextPage13 extends StatefulWidget {
  const NextPage13({Key? key}) : super(key: key);

  @override
  _NextPage13State createState() => _NextPage13State();
}

class _NextPage13State extends State<NextPage13> {
  List<Map<String, dynamic>> enginePrices = [
    {'type': 'Engine Work', 'price': '\$1000', 'iconname': 'engineering'},
    {'type': 'Service', 'price': '\$1500', 'iconname': 'car_repair'},
    {'type': 'Body Work', 'price': '\$2000', 'iconname': 'car_crash'},
  ];

  final Map<String, IconData> _iconMapping = {
    'engineering': Icons.engineering,
    'car_repair': Icons.car_repair,
    'car_crash': Icons.car_crash,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mechanical Work'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Welcome to the Mechanical Page!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Here you can get the best car working staff in town",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Column(
                children: [
                  _buildHorizontalCard(
                    enginePrices[0]['type'],
                    enginePrices[0]['price'],
                    enginePrices[0]['iconname']),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _buildVerticalCard(
                            enginePrices[1]['type'],
                            enginePrices[1]['price'],
                            enginePrices[1]['iconname']),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: _buildVerticalCard(
                            enginePrices[2]['type'],
                            enginePrices[2]['price'],
                            enginePrices[2]['iconname']),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalCard(String roleName, String price, String iconname) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NextPage4(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              _iconMapping[iconname],
              size: 50,
              color: Colors.blue,
            ),
            SizedBox(height: 10),
            Text(
              roleName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Price: $price',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalCard(String roleName, String price, String iconname) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NextPage4(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              _iconMapping[iconname],
              size: 30,
              color: Colors.blue,
            ),
            SizedBox(height: 10),
            Text(
              roleName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Price: $price',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
