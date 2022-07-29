import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/models/add_car.dart';
import 'package:renting_car/provider/add_car_provider.dart';
import 'package:renting_car/provider/add_driver_provider.dart';

class AddCarPage extends StatefulWidget {
  static const String routeName = '/add_car';

  const AddCarPage({Key? key}) : super(key: key);

  @override
  State<AddCarPage> createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  final carNameControler = TextEditingController();
  final carNumberControler = TextEditingController();
  final carCapacityControler = TextEditingController();
  final carManufacturerControler = TextEditingController();
  final carRentControler = TextEditingController();

  String? _imagePath;
  ImageSource _imageSource = ImageSource.camera;
  String? driverName;
  final formKey = GlobalKey<FormState>();
  String? dName;
  late int dId;

  late AddDriverProvider addDriverProvider;


  // bool _oneClickedGetDriver = true;
  // @override
  // void didChangeDependencies() {
  //   addDriverProvider = Provider.of(context);
  //   if (_oneClickedGetDriver) {
  //     addDriverProvider.getAllDrivers();
  //     _oneClickedGetDriver = false;
  //   }
  //
  //   super.didChangeDependencies();
  // }

  @override
  void dispose() {
    carNameControler.dispose();
    carNumberControler.dispose();
    carCapacityControler.dispose();
    carManufacturerControler.dispose();
    carRentControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Car'),
        actions: [
          IconButton(onPressed: _saveAddCarPage, icon: Icon(Icons.save))
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: carNameControler,
              decoration: InputDecoration(
                  labelText: 'Car Name',
                  prefixIcon: Icon(Icons.car_crash_rounded)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: carNumberControler,
              decoration: InputDecoration(
                  labelText: 'Car Number', prefixIcon: Icon(Icons.car_rental)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: carCapacityControler,
              decoration: InputDecoration(
                  labelText: 'Capacity', prefixIcon: Icon(Icons.event_seat)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: carManufacturerControler,
              decoration: InputDecoration(
                  labelText: 'Car Manfacturer', prefixIcon: Icon(Icons.person)),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    child: _imagePath == null
                        ? Image.asset(
                            'images/img.png',
                            height: 100,
                            width: 100,
                            fit: BoxFit.contain,
                          )
                        : Image.file(
                            File(
                              _imagePath!,
                            ),
                            height: 100,
                            width: 100,
                            fit: BoxFit.contain,
                          ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            _imageSource = ImageSource.camera;
                            _getImage();
                          },
                          child: Text('Camera')),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _imageSource = ImageSource.gallery;
                            _getImage();
                          },
                          child: Text('Gallery')),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Consumer<AddDriverProvider>(
                    builder: (context, provider, _) => DropdownButton<String>(
                      dropdownColor: Colors.amber,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                      isExpanded: true,
                      value: driverName,
                      hint: const Text(
                        'Select Driver',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown),
                      ),
                      items: provider.driversName
                          .map(
                            (e) => DropdownMenuItem(
                                value: e,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(e),
                                )),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          driverName = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _getImage() async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    if (selectedImage != null) {
      setState(() {
        _imagePath = selectedImage.path;
        print(_imagePath);
      });
    }
  }

  void _saveAddCarPage() async {
    if (formKey.currentState!.validate()) {
      final addCar = AddCarModel(
          carName: carNameControler.text,
          carNumber: carNumberControler.text,
          carCapacity: carCapacityControler.text,
          carManufacturer: carManufacturerControler.text,
          carImage: _imagePath,
          carDriverName: driverName.toString());

      final status = await Provider.of<AddCarProvider>(context, listen: false)
          .insertAddCars(addCar);
      if (status) {
        Navigator.pop(context);
      } else {}
    }
  }
}
