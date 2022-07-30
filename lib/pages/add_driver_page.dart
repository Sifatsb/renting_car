import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/models/add_driver.dart';
import 'package:renting_car/pages/admin_home_page.dart';
import 'package:renting_car/provider/add_driver_provider.dart';

class AddDriverPage extends StatefulWidget {
  static const String routeName = '/add_driver';

  const AddDriverPage({Key? key}) : super(key: key);

  @override
  State<AddDriverPage> createState() => _AddDriverPageState();
}

class _AddDriverPageState extends State<AddDriverPage> {
  final driverNameControler = TextEditingController();
  final driverPhoneNumberControler = TextEditingController();
  final driverNidControler = TextEditingController();
  final driverExperienceControler = TextEditingController();
  final carNameControler = TextEditingController();

  String? _imagePath;
  ImageSource _imageSource = ImageSource.camera;

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    driverNameControler.dispose();
    driverPhoneNumberControler.dispose();
    driverNidControler.dispose();
    driverExperienceControler.dispose();
    carNameControler.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          'Admin Add Driver',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          IconButton(
              onPressed: _saveDriverList,
              icon: const Icon(
                Icons.save,
                color: Colors.white70,
              ))
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: carNameControler,
              decoration: const InputDecoration(
                  labelText: 'Car Name', prefixIcon: Icon(Icons.car_crash)),
            ),
            TextFormField(
              controller: driverNameControler,
              decoration: const InputDecoration(
                  labelText: 'Driver Name', prefixIcon: Icon(Icons.person)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: driverPhoneNumberControler,
              decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.dialer_sip)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: driverNidControler,
              decoration: const InputDecoration(
                  labelText: 'NID', prefixIcon: Icon(Icons.numbers_sharp)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: driverExperienceControler,
              decoration: const InputDecoration(
                  labelText: 'Experience', prefixIcon: Icon(Icons.person)),
            ),
            Card(
              color: Colors.deepOrange,
              elevation: 25,
              shadowColor: Colors.green,
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    color: Colors.deepOrange,
                    elevation: 25,
                    shadowColor: Colors.green,
                    margin: const EdgeInsets.all(10),
                    child: _imagePath == null
                        ? Image.asset(
                            'images/person.png',
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
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Row(
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
                            child: const Text(
                              'Camera',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )),
                        const SizedBox(
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
                            child: const Text(
                              'Gallery',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )),
                      ],
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

  void _saveDriverList() async {
    if (formKey.currentState!.validate()) {
      final addDriver = AddDriverModel(
        driverName: driverNameControler.text,
        drivingCarName: carNameControler.text,
        driverPhoneNumber: driverPhoneNumberControler.text,
        driverImage: _imagePath,
        driverNid: driverNidControler.text,
        driverExperience: driverExperienceControler.text,
      );

      final status =
          await Provider.of<AddDriverProvider>(context, listen: false)
              .insertAddDrivers(addDriver);
      if (status) {
        Navigator.pop(context);
      } else {}
    }
  }
}
