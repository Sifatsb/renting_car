import 'package:flutter/foundation.dart';
import 'package:renting_car/db/sqlf_lite.dart';
import 'package:renting_car/models/add_driver.dart';

class AddDriverProvider extends ChangeNotifier {
  List<AddDriverModel> addDriverList = [];
  List<String> driversName = [];

  getAllDrivers() async {
    addDriverList = await DBHelper.getAllDriver();
    print("ami driver page theke bolchi");
    print(addDriverList.length);
    addDriverList.forEach((element) {
      driversName.add(element.driverName);
      print(driversName);
    });
    notifyListeners();
  }

  Future<AddDriverModel> getAddDriversById(int id) =>
      DBHelper.getAddDriverById(id);

  Future<bool> insertAddDrivers(AddDriverModel addDriverModel) async {
    final rowId = await DBHelper.insertAddDriver(addDriverModel);
    if (rowId > 0) {
      addDriverModel.id = rowId;
      addDriverList.add(addDriverModel);
      // addCarList.sort((c1, c2) => c1.carName.compareTo(c2.carName));
      notifyListeners();
      return true;
    }
    return false;
  }


  deleteDriverLists(int id) async {
    final deletedRowId = await DBHelper.deleteDriverList(id);
    if (deletedRowId > 0) {
      addDriverList.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }


}
