import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/models/add_car.dart';
import 'package:renting_car/models/add_driver.dart';
import 'package:renting_car/pages/add_driver_page.dart';
import 'package:renting_car/pages/booking_page.dart';
import 'package:renting_car/provider/add_car_provider.dart';
import 'package:renting_car/provider/add_driver_provider.dart';

class ChooseDriverPage extends StatefulWidget {
  static const String routeName = '/chooseDriver';

  const ChooseDriverPage({Key? key}) : super(key: key);

  @override
  State<ChooseDriverPage> createState() => _ChooseDriverPageState();
}

class _ChooseDriverPageState extends State<ChooseDriverPage> {
  late int id;
  double dayPrice = 25;
  double weekPrice = 115;
  double monthPrice = 350;
  final customPackageController = TextEditingController();
  double customPrice = 0;
  double? day;

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as int;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Driver According your choose.."),
      ),
      body: Center(
        child: ListView(
          children: [
            Consumer<AddCarProvider>(
              builder: (context, provider, _) => FutureBuilder<AddCarModel>(
                future: provider.getAddCarsById(id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final model = snapshot.data;
                    print(model.toString());
                    return Column(
                      children: [
                        Image.file(
                          File(model!.carImage!),
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                        Text(model.carName),
                        Text(model.carNumber),
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return const Text("Failed to fetch data");
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            Consumer<AddDriverProvider>(
              builder: (context, provider, _) => FutureBuilder<AddDriverModel>(
                future: provider.getAddDriversById(id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final model = snapshot.data;
                    return Column(
                      children: [
                        Image.file(
                          File(model!.driverImage!),
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                        Text(model.driverName),
                        Text(model.driverNid),
                        Text(model.driverPhoneNumber),
                        Text(model.driverExperience!),
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return const Text("Failed to fetch data");
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 5,
              color: Colors.deepOrange,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Card(
                color: Colors.lightGreen,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Packgae & Price",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Wrap(
                                  children: [
                                    Container(
                                      height: 700,
                                      child: Column(
                                        children: [
                                          ListTile(
                                              title: TextField(
                                                controller:
                                                    customPackageController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText:
                                                      "Enter number of days you wanna rent",
                                                  prefixIcon: Icon(
                                                      Icons.date_range_rounded),
                                                ),
                                              ),
                                              trailing: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      day = double.parse(
                                                          customPackageController
                                                              .text);

                                                      customPrice = (day! * 15);
                                                    });
                                                  },
                                                  icon: Icon(Icons.add))),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    BookingPage.routeName,
                                                    arguments: customPrice);
                                              },
                                              child: Text(
                                                "$customPrice for $day days",
                                                style: TextStyle(
                                                    fontSize: 35,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Text("Custom Package"))
                  ],
                ),
              ),
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, BookingPage.routeName,
                            arguments: dayPrice);
                      },
                      child: Text(
                        "$dayPrice USD/Day",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, BookingPage.routeName,
                            arguments: weekPrice);
                      },
                      child: Text(
                        "$weekPrice USD/Week",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, BookingPage.routeName,
                            arguments: monthPrice);
                      },
                      child: Text(
                        "$monthPrice USD/Month",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
