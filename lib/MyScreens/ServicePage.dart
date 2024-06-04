import 'package:flutter/material.dart';
import 'package:final_project/MyScreens/BookingPage.dart';

class NextPage3 extends StatefulWidget {
  const NextPage3({Key? key}) : super(key: key);

  @override
  _NextPage3State createState() => _NextPage3State();
}

class _NextPage3State extends State<NextPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
        backgroundColor: Color(0xff51a3e5),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Welcome to the SERVICES Page!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Here you can find various indoor and outdoor services',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildGridItem('Carpenter', 'assets/carpenter.png', '\$50'),
                  _buildGridItem('Gutterman', 'assets/Gutterman1.png', '\$60'),
                  _buildGridItem('Plumber', 'assets/Plumber.png', '\$70'),
                  _buildGridItem(
                      'Electrician', 'assets/electrician.png', '\$80'),
                  _buildGridItem('Gardener', 'assets/gardener.png', '\$90'),
                  _buildGridItem('Chef', 'assets/cheif.png', '\$100'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(String roleName, String imagePath, String price) {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 60,
              fit: BoxFit.fitHeight,
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
