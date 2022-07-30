import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/models/booking_model.dart';
import 'package:renting_car/pages/confirm_booking.dart';
import 'package:renting_car/provider/booking_provider.dart';

class BookingPage extends StatefulWidget {
  static const String routeName = '/bookingPage';

  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final userNameController = TextEditingController();
  final userNumberController = TextEditingController();
  final userEmailController = TextEditingController();
  final userFromController = TextEditingController();
  final userToController = TextEditingController();

  String? _rentingDate;
  String? _genderGroupValue = "Male";

  final formKey = GlobalKey<FormState>();

  late int id;

  late double rentAmount;

  @override
  void didChangeDependencies() {
    rentAmount = ModalRoute.of(context)!.settings.arguments as double;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    userNameController.dispose();
    userNumberController.dispose();
    userEmailController.dispose();
    userFromController.dispose();
    userToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          'Booking Page',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text("USD - $rentAmount\$",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
          ),
        ],
      ),

      body: Form(
        key: formKey,

        child: ListView(
          children: [

            TextFormField(
              controller: userNameController,
              decoration: const InputDecoration(
                  labelText: 'Enter Your Name', prefixIcon: Icon(Icons.person)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field must not be empty';
                }
                if (value.length > 20) {
                  return 'Name must be in 20 charecter';
                } else {
                  return null;
                }
              },
            ),

            const SizedBox(
              height: 10,
            ),

            TextFormField(
              controller: userNumberController,
              decoration: const InputDecoration(
                  labelText: 'Enter Your Phone Number',
                  prefixIcon: Icon(Icons.phone)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field must not be empty';
                }
                if (value.length > 20) {
                  return 'Name must be in 20 carecter';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),

            TextFormField(
              controller: userEmailController,
              decoration: const InputDecoration(
                  labelText: 'Enter Your Email', prefixIcon: Icon(Icons.email)),
            ),
            const SizedBox(
              height: 10,
            ),

            TextFormField(
              controller: userFromController,
              decoration: const InputDecoration(
                  labelText: 'Current Address',
                  prefixIcon: Icon(Icons.location_city_rounded)),
            ),
            const SizedBox(
              height: 10,
            ),

            TextFormField(
              controller: userToController,
              decoration: const InputDecoration(
                  labelText: 'Destination Address',
                  prefixIcon: Icon(Icons.location_city_rounded)),
            ),
            const SizedBox(
              height: 10,
            ),

            Card(
              color: Colors.deepOrangeAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.lightGreenAccent,
                        onSurface: Colors.grey, // Disable color
                      ),
                      onPressed: _selectedDate,
                      child: const Text(
                        'Touch here to pick the renting date',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                  Text(
                    _rentingDate == null ? 'No Date Selected' : _rentingDate!,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  )

                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.deepOrangeAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Select Gender ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Radio<String>(
                        value: 'Male',
                        groupValue: _genderGroupValue,
                        onChanged: (value) {
                          setState(() {
                            _genderGroupValue = value;
                          });
                        }),
                    const Text(
                      'Male',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Radio<String>(
                        value: 'Female',
                        groupValue: _genderGroupValue,
                        onChanged: (value) {
                          setState(() {
                            _genderGroupValue = value;
                          });
                        }),
                    const Text(
                      'Female',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title:
                        const Text("You have to save your info first!!!!!!!"),
                    content: const Text("You wanna save your info?"),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text("NO")),
                      TextButton(
                          onPressed: () => _saveContactInfo(),
                          child: const Text("YES"))
                    ],
                  ),
                );
              },
              child: const Text('Enter Details to Confirm your Booking'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  fixedSize: const Size(50, 70),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ],
        ),
      ),
    );
  }

  void _saveContactInfo() async {
    if (formKey.currentState!.validate()) {
      final booking = BookingModel(
        userName: userNameController.text,
        userNumber: userNumberController.text,
        userEmail: userEmailController.text,
        userFrom: userFromController.text,
        userTo: userToController.text,
        gender: _genderGroupValue,
        rentDate: _rentingDate.toString(),
      );
      print(booking.toString());

      final status =
          await Provider.of<AddBookingProvider>(context, listen: false)
              .insertBookings(booking);

      if (status) {
        Navigator.pushReplacementNamed(context, ConfirmBooking.routeName,
            arguments: rentAmount);
      } else {}
    }
  }

  void _selectedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2023));

    if (selectedDate != null) {
      setState(() {
        _rentingDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }
}
