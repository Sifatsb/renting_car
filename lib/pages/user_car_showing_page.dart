import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/models/add_car.dart';
import 'package:renting_car/pages/choose_driver_page.dart';
import 'package:renting_car/pages/user_home_page.dart';
import 'package:renting_car/provider/add_car_provider.dart';

class UserCarShowing extends StatefulWidget {
  static const String routeName = '/userCarShowing';

  const UserCarShowing({Key? key}) : super(key: key);

  @override
  State<UserCarShowing> createState() => _UserCarShowingState();
}

class _UserCarShowingState extends State<UserCarShowing> {
  final searchController = TextEditingController();
  bool isObscure = true;
  int selectedIndex = 0;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'hye!!! welcome',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(onTap: () {}, child: const Text('About')),
                    PopupMenuItem(onTap: () {}, child: const Text('Home')),
                    PopupMenuItem(onTap: () {}, child: const Text('LOGIN')),
                    PopupMenuItem(onTap: () {}, child: const Text('LOGOUT')),
                  ])
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: Consumer<AddCarProvider>(
          builder: (context, provider, _) => BottomNavigationBar(
            currentIndex: selectedIndex,
            selectedItemColor: Colors.white70,
            backgroundColor: Colors.deepOrange,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
              if (selectedIndex == 0) {
                provider.getAllCars();
              } else if (selectedIndex == 1) {
              Navigator.pushReplacementNamed(context, UserHomepage.routeName);
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.car_crash_rounded), label: "All Cars"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.car_crash_rounded), label: "Home"),
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            ListTile(
              title: TextField(
                controller: searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Search car by  name..",
                  prefixIcon: Icon(Icons.car_rental_rounded),
                ),
              ),
              trailing: Consumer<AddCarProvider>(
                  builder: (context, provider, _) => IconButton(
                      onPressed: () {
                        print("the car name is ..............");
                        print(searchController.text);
                        provider.getAllSearchedCarByName(
                            searchController.text);
                      },
                      icon: Icon(Icons.search))),
            ),
            Text(
              "Thousand of Car",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
              textAlign: TextAlign.start,
            ),
            Text(
              "WAITING FOR YOU",
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 60,
            ),

            Container(
              height: 500,
              width: 70,
              child: Consumer<AddCarProvider>(
                  builder: (context, provider, _) => ListView.builder(
                      itemCount: provider.addCarList.length,
                      itemBuilder: (context, index) {
                        final car = provider.addCarList[index];
                        return Card(

                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ChooseDriverPage.routeName,
                                  arguments: car.id);
                            },
                            child: Column(
                              children: [
                                Image.file(
                                  File(car.carImage!),
                                  height: 60,
                                  fit: BoxFit.cover,
                                  width: 30,
                                ),
                                Text(car.carName),
                                Text(car.carDriverName.toString()),
                                Text(car.carNumber),
                              ],
                            ),
                          ),
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
