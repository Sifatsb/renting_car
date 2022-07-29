import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),

      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(child: Column(

              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: const Text('Email'),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),

                TextField(
                  controller: passwordController,
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    label: const Text('Password'),
                    prefixIcon: Icon(Icons.password),
                  ),
                ),

                TextButton(

                    onPressed: () {}, child: const Text('Login')),

              ],

            )),
          ),
          
        ],
        
      ),

    );
  }
}
