import 'package:final_project/MyScreens/BookingDetails.dart';
import 'package:flutter/material.dart';
import 'package:final_project/MyScreens/LandingPage.dart';
import 'package:final_project/MyScreens/ServicePage.dart';
import 'package:final_project/MyScreens/MechanicalWork.dart';

class NextPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(0xFF4A90E2);
    final Color accentColor = Color(0xFF50E3C2);
    final Color secondaryAccentColor = Color(0xFF9B51E0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'KAARIGAR',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        elevation: 20.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Asim Muneer"),
              accountEmail: Text("IV-C"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("A"),
              ),
              decoration: BoxDecoration(color: secondaryAccentColor),
            ),
            ListTile(
              title: Text("Inbox"),
              leading: Icon(Icons.mail, color: primaryColor),
            ),
            Divider(height: 0.01),
            ListTile(
                title: Text("Bookings"),
                leading: Icon(Icons.book_online, color: primaryColor),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookingDetailsPage()),
                  );
                }),
            Divider(height: 0.1),
            ListTile(
              title: Text("Primary"),
              leading: Icon(Icons.inbox, color: primaryColor),
            ),
            ListTile(
              title: Text("Social"),
              leading: Icon(Icons.people, color: primaryColor),
            ),
            Divider(height: 0.01),
            ListTile(
              title: Text("Promotions"),
              leading: Icon(Icons.local_offer, color: primaryColor),
            ),
            Divider(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LandingPage(title: 'Welcome Screen'),
                  ),
                );
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.currency_bitcoin,
                                color: primaryColor),
                            title: Text('0 Coin',
                                style: TextStyle(color: primaryColor)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 9.0),
                Expanded(
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.wallet, color: primaryColor),
                            title: Text(
                              '100',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                              title: Text('Home Services',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 24)),
                              trailing: Icon(
                                Icons.home_repair_service,
                                size: 40,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NextPage3(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: primaryColor,
                                  onPrimary: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 16),
                                ),
                                child: Text('Residential'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NextPage3(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: primaryColor,
                                  onPrimary: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 16),
                                ),
                                child: Text('Commercial'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text('Mechanical Work',
                                style: TextStyle(
                                    color: primaryColor, fontSize: 24)),
                            trailing: Icon(
                              Icons.car_repair,
                              size: 40,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NextPage13(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: accentColor,
                                  onPrimary: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 16),
                                ),
                                child: Text('Cars Only'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text('Other Services',
                                style: TextStyle(
                                    color: primaryColor, fontSize: 24)),
                            trailing: Icon(
                              Icons.design_services,
                              size: 40,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: secondaryAccentColor,
                                  onPrimary: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 16),
                                ),
                                child: Text('Other'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
