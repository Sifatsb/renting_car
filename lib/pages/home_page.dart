import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:renting_car/pages/admin_home_page.dart';
import 'package:renting_car/pages/admin_login_page.dart';
import 'package:renting_car/pages/user_home_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Sthanantror', textAlign: TextAlign.center,),
      ),
      body: SafeArea(

        child: Stack(
          children: [
            Center(

              child: Lottie.asset(
                  "images/animation"
                      ".json",
                  repeat: false),
            ),

            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width/3,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  GestureDetector(
                    onTap: (){Navigator.pushNamed(context, AdminLoginPage.routeName);},
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
                          'Admin Login',
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30,),

                  GestureDetector(
                    onTap: (){Navigator.pushNamed(context, UserHomepage.routeName);},
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
                          'User Login',
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
}
