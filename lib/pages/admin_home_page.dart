import 'package:flutter/material.dart';
import 'package:renting_car/pages/add_car_list_page.dart';
import 'package:renting_car/pages/add_car_page.dart';
import 'package:renting_car/pages/add_driver_list_page.dart';
import 'package:renting_car/pages/add_driver_page.dart';

class AdminHomePage extends StatefulWidget {
  static const String routeName = '/admin';

  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddCarListPage.routeName);
                },
                child: Text("Admin Add Car List")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddDriverListPage.routeName);
                },
                child: Text("Admin Add Driver List")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddCarPage.routeName);
                },
                child: Text("Admin Add Car")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddDriverPage.routeName);
                },
                child: Text("Admin Add Driver")),
          ],
        ),
      ),
    );
  }
}
