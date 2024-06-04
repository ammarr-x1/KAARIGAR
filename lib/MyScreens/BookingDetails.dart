import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingDetailsPage extends StatefulWidget {
  @override
  _BookingDetailsPageState createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  String? _email;
  String? _serviceType;

  final TextEditingController emailController = TextEditingController();
  bool _showBookingDetails = false;
  Future<Map<String, dynamic>>? _bookingDetailsFuture;

  Future<Map<String, dynamic>> _fetchBookingDetails() async {
    // Fetch the booking details
    QuerySnapshot bookingSnapshot = await FirebaseFirestore.instance
        .collection('bookings')
        .where('email', isEqualTo: _email)
        .where('service_type', isEqualTo: _serviceType)
        .get();

    // Assuming there is only one booking per email and service type
    if (bookingSnapshot.docs.isNotEmpty) {
      var bookingData =
          bookingSnapshot.docs.first.data() as Map<String, dynamic>;

      // Fetch the service details
      DocumentSnapshot serviceSnapshot = await FirebaseFirestore.instance
          .collection('Services')
          .doc(_serviceType)
          .get();

      var serviceData = serviceSnapshot.data() as Map<String, dynamic>;

      // Combine both sets of data
      return {
        'service': serviceData,
        'booking': bookingData,
      };
    } else {
      throw Exception(
          'No booking found for the specified email and service type');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Colors from the logo
    final Color primaryColor = Color(0xFF4A90E2);

    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Enter Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _serviceType,
              decoration: InputDecoration(
                labelText: 'Select Service Type',
                border: OutlineInputBorder(),
              ),
              items: <String>[
                'Plumber',
                'Carpenter',
                'Electrician',
                'Chef',
                'Gardener',
                'Gutterman',
                'Engine Work',
                'Service',
                'Body Work'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _serviceType = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _email = emailController.text;
                  _showBookingDetails = true;
                  _bookingDetailsFuture = _fetchBookingDetails();
                });
              },
              child: Text('Fetch Booking Details'),
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                onPrimary: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            _showBookingDetails
                ? FutureBuilder<Map<String, dynamic>>(
                    future: _bookingDetailsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data == null) {
                        return Center(child: Text('No data found'));
                      }

                      var serviceData = snapshot.data!['service'];
                      var bookingData = snapshot.data!['booking'];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _serviceType ?? '',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                          SizedBox(height: 10),
                          Text('Name: ${serviceData['name']}'),
                          Text('Number: ${serviceData['number']}'),
                          Text('Price: ${serviceData['price']}'),
                          Text('Experience: ${serviceData['experience']} '),
                          SizedBox(height: 20),
                          Divider(),
                          SizedBox(height: 20),
                          Text(
                            'Booking Information',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                          SizedBox(height: 10),
                          Text('Full Name: ${bookingData['full_name']}'),
                          Text('City: ${bookingData['city']}'),
                          Text('Address: ${bookingData['address']}'),
                          Text('Phone Number: ${bookingData['phone_number']}'),
                          Text('Email: ${bookingData['email']}'),
                        ],
                      );
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
