import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/pages/add_driver_details_page.dart';
import 'package:renting_car/provider/add_driver_provider.dart';

class AddDriverListPage extends StatefulWidget {
  static const String routeName = '/driver_list';

  const AddDriverListPage({Key? key}) : super(key: key);

  @override
  State<AddDriverListPage> createState() => _AddDriverListPageState();
}

class _AddDriverListPageState extends State<AddDriverListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Admin Driver List Page",
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: Consumer<AddDriverProvider>(
        builder: (context, provider, _) => ListView.builder(
          itemCount: provider.addDriverList.length,
          itemBuilder: (context, index) {
            final driver = provider.addDriverList[index];
            return Dismissible(
              key: ValueKey(driver.id),
              direction: DismissDirection.endToStart,
              confirmDismiss: _showConfirmationDialog,
              onDismissed: (direction) {
                provider.deleteDriverLists(driver.id!);
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
              child: Center(
                child: Container(
                  width: double.infinity,

                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.deepOrange,
                    elevation: 10,
                    shadowColor: Colors.green,
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(File(
                              driver.driverImage!,

                            )),
                          ),
                          title: Text(driver.driverName.toUpperCase(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          subtitle: Text(driver.driverPhoneNumber,
                              style: TextStyle(color: Colors.white)),
                        ),
                        ButtonTheme(
                          child: ButtonBar(
                            children: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context,
                                        AddDriverShowAllDetailsPage.routeName,
                                        arguments: driver.id);
                                  },
                                  child: Text("Show Details",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
        title: const Text("Delete Driver List"),
        content: const Text("Are you sure to delete this Driver?"),
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
