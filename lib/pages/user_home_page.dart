import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/pages/user_car_showing_page.dart';

class UserHomepage extends StatefulWidget {
  static const String routeName = '/user';

  const UserHomepage({Key? key}) : super(key: key);

  @override
  State<UserHomepage> createState() => _UserHomepageState();
}

class _UserHomepageState extends State<UserHomepage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Page"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Sthanantor",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.orange),
            textAlign: TextAlign.end,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, UserCarShowing.routeName);
            },
            style: TextButton.styleFrom(
                alignment: Alignment.bottomCenter,
                primary: Colors.red,
                elevation: 2,
                backgroundColor: Colors.amber),
            child: Text("Get Started...."),
          )
        ],
      ),
    );
  }
}
