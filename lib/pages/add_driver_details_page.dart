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
      // backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
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
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          child: Image.file(
                            File(model!.driverImage!),
                            height: 350,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),



                    const SizedBox(height: 30,),
                    Card(
                        color: Colors.white38,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.person,
                                  size: 40,
                                ),
                                Text(
                                    " Driver Name - ${model.driverName.toUpperCase()}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      backgroundColor: Colors.white38,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.numbers,
                                  size: 40,
                                ),
                                Text(
                                    " Driver Phone Number\n - ${model.driverPhoneNumber}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      backgroundColor: Colors.white38,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.now_widgets_outlined,
                                  size: 40,
                                ),
                                Text(" Driver NID Number - ${model.driverNid}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      backgroundColor: Colors.white38,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.car_rental,
                                  size: 40,
                                ),
                                Text(
                                    "Car Name - ${model.drivingCarName}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      backgroundColor: Colors.white38,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.extension,
                                  size: 40,
                                ),
                                Text(
                                    " Driving Experience - ${model.driverExperience}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      backgroundColor: Colors.white38,
                                    )),
                              ],
                            ),
                          ],
                        )),
                    const SizedBox(
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
