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
      // backgroundColor: Colors.grey.shade300,
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
                // color: Colors.red,
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
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),
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
                                    " Car Name - ${model.carName.toUpperCase()}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      backgroundColor: Colors.white38,
                                    )),
                              ],
                            ),
                            const SizedBox(height: 15,),

                            Row(
                              children: [
                                const Icon(
                                  Icons.numbers,
                                  size: 40,
                                ),
                                Text(" Car Number - ${model.carNumber}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      backgroundColor: Colors.white38,
                                    )),
                              ],
                            ),
                            const SizedBox(height: 15,),

                            Row(
                              children: [
                                const Icon(
                                  Icons.event_seat,
                                  size: 40,
                                ),
                                Text(" Car Capacity - ${model.carCapacity}",
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
                                  Icons.production_quantity_limits_sharp,
                                  size: 40,
                                ),
                                Text(
                                    " Car Manufacturer - ${model.carManufacturer}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      backgroundColor: Colors.white38,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 15,
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
