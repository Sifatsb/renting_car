import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/models/add_car.dart';
import 'package:renting_car/pages/admin_home_page.dart';
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
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Admin - Add Car',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          IconButton(
              onPressed: _saveAddCarPage,
              icon: Icon(
                Icons.save,
                color: Colors.white70,
              ))
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
              height: 20,
            ),
            Card(
              color: Colors.deepOrange,
              elevation: 25,
              shadowColor: Colors.green,
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    color: Colors.deepOrange,
                    elevation: 25,
                    shadowColor: Colors.green,
                    margin: EdgeInsets.all(10),
                    child: _imagePath == null
                        ? Image.asset(
                            'images/img.png',
                            height: 200,
                            width: 200,
                            fit: BoxFit.contain,
                          )
                        : Image.file(
                            File(
                              _imagePath!,
                            ),
                            height: 200,
                            width: 200,
                            fit: BoxFit.contain,
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.pink,
                              fixedSize: const Size(130, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            _imageSource = ImageSource.camera;
                            _getImage();
                          },
                          child: Text(
                            'Camera',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.pink,
                              fixedSize: const Size(130, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            _imageSource = ImageSource.gallery;
                            _getImage();
                          },
                          child: Text(
                            'Gallery',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Consumer<AddDriverProvider>(
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
                              color: Colors.yellowAccent),
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
                  ),
                ],
              ),
            ),

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
