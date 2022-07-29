import 'add_car.dart';

class AddDriverModel {
  int? id;
  String drivingCarName;
  String driverName;
  String driverPhoneNumber;
  String? driverImage;
  String driverNid;
  String? driverExperience;

  AddDriverModel(
      {this.id,
      required this.drivingCarName,
      required this.driverName,
      required this.driverPhoneNumber,
      this.driverImage,
      required this.driverNid,
      this.driverExperience});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      tableAddCarColDrivingCarName: drivingCarName,
      tableAddCarColDriverName: driverName,
      tableAddCarColDriverPhoneNumber: driverPhoneNumber,
      tableAddCarColDriverNid: driverNid,
      tableAddCarColCarDriverExperience: driverExperience,
      tableAddCarColCarDriverImage: driverImage,
    };
    if (id != null) {
      map[tableAddDriverColId] = id;
    }
    return map;
  }

  factory AddDriverModel.fromMap(Map<String, dynamic> map) => AddDriverModel(
        id: map[tableAddDriverColId],
        drivingCarName: map[tableAddCarColCarName],
        driverName: map[tableAddCarColDriverName],
        driverPhoneNumber: map[tableAddCarColDriverPhoneNumber],
        driverNid: map[tableAddCarColDriverNid],
        driverExperience: map[tableAddCarColCarDriverExperience],
        driverImage: map[tableAddCarColCarDriverImage],
      );
}

const String tableAddDriver = 'tbl_add_driver';
const String tableAddDriverColId = 'id';
const String tableAddCarColDrivingCarName = 'carName';
const String tableAddCarColDriverName = 'driverName';
const String tableAddCarColDriverPhoneNumber = 'driverPhoneNumber';
const String tableAddCarColDriverNid = 'driverNid';
const String tableAddCarColCarDriverExperience = 'driverExperience';
const String tableAddCarColCarDriverImage = 'driverImage';
