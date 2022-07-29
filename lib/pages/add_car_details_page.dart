import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/models/add_car.dart';
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
      appBar: AppBar(
        title: Text("Admin Show All Car Details"),
      ),
      body: Center(
        child: Consumer<AddCarProvider>(
          builder: (context, provider, _) => FutureBuilder<AddCarModel>(
            future: provider.getAddCarsById(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final model = snapshot.data;
                return ListView(
                  children: [
                    Image.file(
                      File(model!.carImage!),
                      height: 60,
                      fit: BoxFit.cover,
                      width: 30,
                    ),
                    Text(model.carName),
                    Text(model.carNumber),
                    Text(model.carCapacity),
                    Text(model.carManufacturer!),
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
