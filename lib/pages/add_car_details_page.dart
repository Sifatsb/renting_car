import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/models/add_car.dart';
import 'package:renting_car/pages/admin_home_page.dart';
import 'package:renting_car/provider/add_car_provider.dart';

class AddCarShowAllDetailsPage extends StatefulWidget {
  static const String routeName = '/carDetailsShow';

  const AddCarShowAllDetailsPage({Key? key}) : super(key: key);

  @override
  State<AddCarShowAllDetailsPage> createState() =>
      _AddCarShowAllDetailsPageState();
}

class _AddCarShowAllDetailsPageState extends State<AddCarShowAllDetailsPage> {
  late int id;

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as int;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Admin Show  Car Details"),
      ),
      body: Consumer<AddCarProvider>(
        builder: (context, provider, _) => FutureBuilder<AddCarModel>(
          future: provider.getAddCarsById(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final model = snapshot.data;
              return Card(
                color: Colors.red,
                elevation: 25,
                shadowColor: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.file(
                          File(model!.carImage!),
                          height: 350,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Card(
                        color: Colors.redAccent,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 60,
                                ),
                                Text(
                                    " Car Name - ${model.carName.toUpperCase()}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellowAccent,
                                      backgroundColor: Colors.grey,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.numbers,
                                  size: 60,
                                ),
                                Text(" Car Number - ${model.carNumber}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellowAccent,
                                      backgroundColor: Colors.grey,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.event_seat,
                                  size: 60,
                                ),
                                Text(" Car Capacity - ${model.carCapacity}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellowAccent,
                                      backgroundColor: Colors.grey,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.production_quantity_limits_sharp,
                                  size: 60,
                                ),
                                Text(
                                    " Car Manufacturer - ${model.carManufacturer}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellowAccent,
                                      backgroundColor: Colors.grey,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),

                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return const Text("Failed to fetch data");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
