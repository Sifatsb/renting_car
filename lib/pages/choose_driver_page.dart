import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/models/add_car.dart';
import 'package:renting_car/models/add_driver.dart';
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
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("Choose Driver"),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Image.file(
                              File(model!.carImage!),
                              width: MediaQuery.of(context).size.width/3,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Car Name: ${model.carName}'),
                                Text('Car Number: ${model.carNumber}'),
                              ],
                            )

                          ],
                        ),

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

            const SizedBox(height: 10,),

            Consumer<AddDriverProvider>(
              builder: (context, provider, _) => FutureBuilder<AddDriverModel>(
                future: provider.getAddDriversById(id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final model = snapshot.data;
                    return Column(

                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Image.file(
                              File(model!.driverImage!),
                              width: MediaQuery.of(context).size.width/3,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Driver Name: ${model.driverName}'),
                                Text('Driver NID: ${model.driverNid}'),
                                Text('Phone Number: ${model.driverPhoneNumber}'),
                                Text('Experience: ${model.driverExperience!}'),
                              ],
                            )

                          ],
                        ),

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

            const SizedBox(
              height: 20,
            ),

            Container(
              height: 5,
              color: Colors.deepOrange,
            ),

            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Card(
                color: Colors.lightGreen,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
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
                                                decoration: const InputDecoration(
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
                                          const SizedBox(
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
                                                style: const TextStyle(
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
                        "$dayPrice\$ \nUSD/Day",
                        style: const TextStyle(
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
                        "$weekPrice\$ \nUSD/Week",
                        style: const TextStyle(
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
                        "$monthPrice\$ \n USD/Month",
                        style: const TextStyle(
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
