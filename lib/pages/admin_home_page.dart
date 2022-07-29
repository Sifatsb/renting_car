import 'package:carousel_slider/carousel_slider.dart';
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
  int selectedIndex = 0;

  final List<String> imagesList = [
    'images/car1.jpg',
    'images/car2.jpg',
    'images/car3.jpg',
    'images/car4.jpg',
    'images/car5.jpg',
    'images/car6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          "Admin Home Page",
          style: TextStyle(color: Colors.white70),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Colors.white70,
          backgroundColor: Colors.deepOrange,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
            if (selectedIndex == 0) {
            } else if (selectedIndex == 1) {}
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home Page"),
            BottomNavigationBarItem(
                icon: Icon(Icons.details), label: "About Page"),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: MediaQuery.of(context).size.height - 600,
              ),
              items: imagesList
                  .map(
                    (item) => Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height - 600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Colors.grey,
                      child: Container(
                        height: 160,
                        width: 160,
                        child: Center(
                          child: ListTile(
                            title: TextButton(
                              style: TextButton.styleFrom(
                                alignment: Alignment.bottomCenter,
                                primary: Colors.white,
                                onSurface: Colors.grey,
                                shadowColor: Colors.red,
                                elevation: 15,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AddCarPage.routeName);
                              },
                              child: Text(
                                "Add Car",
                                style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      elevation: 28,
                      shadowColor: Colors.red,
                      margin: EdgeInsets.all(20),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Colors.grey,
                      child: Container(
                        height: 160,
                        width: 160,
                        child: Center(
                          child: ListTile(
                            title: TextButton(
                              style: TextButton.styleFrom(
                                alignment: Alignment.bottomCenter,
                                primary: Colors.white,
                                onSurface: Colors.grey,
                                shadowColor: Colors.red,
                                elevation: 15,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AddCarListPage.routeName);
                              },
                              child: Text(
                                "Show Car List",
                                style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      elevation: 28,
                      shadowColor: Colors.red,
                      margin: EdgeInsets.all(20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Colors.grey,
                      child: Container(
                        height: 160,
                        width: 160,
                        child: Center(
                          child: ListTile(
                            title: TextButton(
                              style: TextButton.styleFrom(
                                alignment: Alignment.bottomCenter,
                                primary: Colors.white,
                                onSurface: Colors.grey,
                                shadowColor: Colors.red,
                                elevation: 15,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AddDriverPage.routeName);
                              },
                              child: Text(
                                "Add Driver",
                                style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      elevation: 28,
                      shadowColor: Colors.red,
                      margin: EdgeInsets.all(20),
                    ),
                    Card(

                      elevation: 28,
                      margin: EdgeInsets.all(20),
                      shadowColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Colors.grey,
                      child: Container(
                        height: 160,
                        width: 160,
                        child: Center(
                          child: ListTile(
                            title: TextButton(
                              style: TextButton.styleFrom(
                                alignment: Alignment.bottomCenter,
                                primary: Colors.white,
                                onSurface: Colors.grey,
                                shadowColor: Colors.red,
                                elevation: 15,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AddDriverListPage.routeName);
                              },
                              child: Text(
                                "Show Driver List",
                                style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
