import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/models/add_driver.dart';
import 'package:renting_car/pages/admin_home_page.dart';
import 'package:renting_car/provider/add_driver_provider.dart';

class AddDriverShowAllDetailsPage extends StatefulWidget {
  static const String routeName = '/driver_details';

  const AddDriverShowAllDetailsPage({Key? key}) : super(key: key);

  @override
  State<AddDriverShowAllDetailsPage> createState() =>
      _AddDriverShowAllDetailsPageState();
}

class _AddDriverShowAllDetailsPageState
    extends State<AddDriverShowAllDetailsPage> {
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
        title: Text(
          "Admin Show All Driver Details",
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: Consumer<AddDriverProvider>(
        builder: (context, provider, _) => FutureBuilder<AddDriverModel>(
          future: provider.getAddDriversById(id),
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
                      child: Center(
                        child: Container(
                          height: 300,
                          width: 400,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.file(
                            File(model!.driverImage!),
                            height: 350,
                            fit: BoxFit.cover,
                          ),
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
                                  size: 30,
                                ),
                                Text(
                                    " Driver Name - ${model.driverName.toUpperCase()}",
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
                                  size: 30,
                                ),
                                Text(
                                    " Driver Phone Number\n - ${model.driverPhoneNumber}",
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
                                  Icons.now_widgets_outlined,
                                  size: 30,
                                ),
                                Text(" Driver NID Number - ${model.driverNid}",
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
                                  Icons.car_rental,
                                  size: 30,
                                ),
                                Text(
                                    " List of Driving Car Name - ${model.drivingCarName}",
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
                                  Icons.extension,
                                  size: 30,
                                ),
                                Text(
                                    " Driving Experience - ${model.driverExperience}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellowAccent,
                                      backgroundColor: Colors.grey,
                                    )),
                              ],
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
