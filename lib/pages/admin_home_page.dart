import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:renting_car/pages/add_car_details_page.dart';
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
      backgroundColor: Colors.grey.shade300,
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
          items: const [
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
                height: MediaQuery.of(context).size.height - 400,
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
                              height: MediaQuery.of(context).size.height - 400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),

            SizedBox(height: 30,),

            Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                  GestureDetector(
                    onTap: (){Navigator.pushNamed(context, AddCarPage.routeName);},
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [

                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: Offset(4, 4),
                            ),

                            BoxShadow(
                              color: Colors.white,
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: Offset(-4, -4),
                            ),

                          ]

                      ),

                      child: const Center(
                        child: Text(
                          'Add Car',
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 30,),

                  GestureDetector(
                    onTap: (){Navigator.pushNamed(context, AddDriverPage.routeName);},
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [

                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: Offset(4, 4),
                            ),

                            BoxShadow(
                              color: Colors.white,
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: Offset(-4, -4),
                            ),

                          ]

                      ),


                      child: const Center(
                        child: Text(
                          'Add Driver',
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],),

                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    GestureDetector(
                      onTap: (){Navigator.pushNamed(context, AddCarListPage.routeName);},
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [

                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(4, 4),
                              ),

                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(-4, -4),
                              ),

                            ]

                        ),

                        child: const Center(
                          child: Text(
                            'Car Details',
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 30,),

                    GestureDetector(
                      onTap: (){Navigator.pushNamed(context, AddDriverListPage.routeName);},
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [

                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(4, 4),
                              ),

                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(-4, -4),
                              ),

                            ]

                        ),


                        child: const Center(
                          child: Text(
                            'Driver Details',
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],),



              ],
            ),

          ],

        ),
      ),
    );
  }
}
