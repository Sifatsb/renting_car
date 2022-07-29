import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/models/add_driver.dart';
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
      appBar: AppBar(
        title: Text("Admin Show All Driver Details"),
      ),
      body: Center(
        child: Consumer<AddDriverProvider>(
          builder: (context, provider, _) => FutureBuilder<AddDriverModel>(
            future: provider.getAddDriversById(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final model = snapshot.data;
                return ListView(
                  children: [
                    Image.file(
                      File(model!.driverImage!),
                      height: 60,
                      fit: BoxFit.cover,
                      width: 30,
                    ),
                    Text(model.driverName),
                    Text(model.driverPhoneNumber),
                    Text(model.drivingCarName),
                    Text(model.driverNid),
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
      ),
    );
  }
}
