import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/pages/add_car_details_page.dart';
import 'package:renting_car/pages/add_car_list_page.dart';
import 'package:renting_car/pages/add_car_page.dart';
import 'package:renting_car/pages/add_driver_details_page.dart';
import 'package:renting_car/pages/add_driver_list_page.dart';
import 'package:renting_car/pages/add_driver_page.dart';
import 'package:renting_car/pages/admin_home_page.dart';
import 'package:renting_car/pages/booking_page.dart';
import 'package:renting_car/pages/choose_driver_page.dart';
import 'package:renting_car/pages/confirm_booking.dart';
import 'package:renting_car/pages/home_page.dart';
import 'package:renting_car/pages/loginPage.dart';
import 'package:renting_car/pages/user_car_showing_page.dart';
import 'package:renting_car/pages/user_home_page.dart';
import 'package:renting_car/provider/add_car_provider.dart';
import 'package:renting_car/provider/add_driver_provider.dart';
import 'package:renting_car/provider/booking_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AddCarProvider()..getAllCars()),
    ChangeNotifierProvider(
        create: (context) => AddDriverProvider()..getAllDrivers()),
    ChangeNotifierProvider(
        create: (context) => AddBookingProvider()..getAllBookings()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        AddCarPage.routeName: (context) => AddCarPage(),
        AddCarListPage.routeName: (context) => AddCarListPage(),
        AddDriverListPage.routeName: (context) => AddDriverListPage(),
        AddDriverPage.routeName: (context) => AddDriverPage(),
        LoginPage.routeName: (context) => LoginPage(),
        AdminHomePage.routeName: (context) => AdminHomePage(),
        UserHomepage.routeName: (context) => UserHomepage(),
        UserCarShowing.routeName: (context) => UserCarShowing(),
        ChooseDriverPage.routeName: (context) => ChooseDriverPage(),
        BookingPage.routeName: (context) => BookingPage(),
        ConfirmBooking.routeName: (context) => ConfirmBooking(),
        AddCarShowAllDetailsPage.routeName: (context) =>
            AddCarShowAllDetailsPage(),
        AddDriverShowAllDetailsPage.routeName: (context) =>
            AddDriverShowAllDetailsPage(),
      },
    );
  }
}
