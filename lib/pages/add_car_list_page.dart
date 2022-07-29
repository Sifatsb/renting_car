import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/pages/add_car_details_page.dart';
import 'package:renting_car/provider/add_car_provider.dart';

class AddCarListPage extends StatefulWidget {
  static const String routeName = '/car_list';

  const AddCarListPage({Key? key}) : super(key: key);

  @override
  State<AddCarListPage> createState() => _AddCarListPageState();
}

class _AddCarListPageState extends State<AddCarListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin- Show Cars List"),
      ),
      body: Consumer<AddCarProvider>(
        builder: (context, provider, _) => ListView.builder(
          itemCount: provider.addCarList.length,
          itemBuilder: (context, index) {
            final cars = provider.addCarList[index];
            return Dismissible(
              key: ValueKey(cars.id),
              direction: DismissDirection.endToStart,
              confirmDismiss: _showConfirmationDialog,
              onDismissed: (direction) {
                provider.deleteCarLists(cars.id!);
              },
              background: Container(
                color: Colors.grey,
                padding: const EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.delete,
                  size: 40,
                ),
              ),
              child: ListTile(

                leading: CircleAvatar(
                  backgroundImage: FileImage(File(cars.carImage!)),
                ),
                title: Text(cars.carName.toUpperCase()),
                subtitle: Text(cars.carNumber),
                trailing: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AddCarShowAllDetailsPage.routeName,
                          arguments: cars.id);
                    },
                    child: Text("Show Details")),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<bool?> _showConfirmationDialog(DismissDirection direction) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Car List"),
        content: const Text("Are you sure to delete this Car?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("NO")),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("YES"))
        ],
      ),
    );
  }
}
