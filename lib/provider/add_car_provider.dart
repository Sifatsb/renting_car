

import 'package:flutter/foundation.dart';
import 'package:renting_car/db/sqlf_lite.dart';
import 'package:renting_car/models/add_car.dart';
class AddCarProvider extends ChangeNotifier{
  List<AddCarModel> addCarList = [];

  getAllCars() async {
    addCarList = await DBHelper.getAllCar();
    notifyListeners();
  }
  Future<AddCarModel> getAddCarsById(int id) => DBHelper.getAddCarById(id);

  Future<bool> insertAddCars(AddCarModel addCarModel) async {
    final rowId = await DBHelper.insertAddCar(addCarModel);
    if(rowId > 0) {
      addCarModel.id = rowId;
      addCarList.add(addCarModel);
      // addCarList.sort((c1, c2) => c1.carName.compareTo(c2.carName));
      notifyListeners();
      return true;
    }
    return false;
  }

  getAllSearchedCarByName(String searchProvider) async {
    addCarList  =    await DBHelper.searchAllCarByName(searchProvider);
    notifyListeners();
  }

  deleteCarLists(int id) async {
    final deletedRowId = await DBHelper.deleteCarList(id);
    if (deletedRowId > 0) {
      addCarList.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }


}