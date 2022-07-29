import 'package:path/path.dart';
import 'package:renting_car/models/add_car.dart';
import 'package:renting_car/models/add_driver.dart';
import 'package:renting_car/models/booking_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const String createTableAddCar = '''
  create table $tableAddCar(
  $tableAddCarColId integer primary key,
  $tableAddCarColDriverId integer,
  $tableAddCarColCarName text,
  $tableAddCarColCarNumber text,
  $tableAddCarColCarCapacity text,
  $tableAddCarColCarDriverName text,
  $tableAddCarColCarManufacturer text,
  $tableAddCarColCarImage text)''';

  static const String createTableAddDriver = '''
  create table $tableAddDriver(
  $tableAddCarColId integer primary key,
  $tableAddCarColDrivingCarName text,
  $tableAddCarColDriverName text,
  $tableAddCarColDriverPhoneNumber text,
  $tableAddCarColDriverNid text,
  $tableAddCarColCarDriverExperience text,
  $tableAddCarColCarDriverImage text)''';

  static const String createTableBooking = '''
  create table $tableBooking(
  $tableBookingColId integer primary key,
  $tableBookingColName text,
  $tableBookingColNumber text,
  $tableBookingColEmail text,
  $tableBookingColUserFrom double,
  $tableBookingColUserTo text,
  $tableBookingColRentDate text,
  $tableBookingColGender text)''';

  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = join(rootPath, 'rent_car.db');

    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(createTableAddCar);
      db.execute(createTableAddDriver);
      db.execute(createTableBooking);
    });
  }

  static Future<int> insertAddCar(AddCarModel addCarModel) async {
    final db = await open();
    return db.insert(tableAddCar, addCarModel.toMap());
  }

  static Future<int> insertAddDriver(AddDriverModel addDriverModel) async {
    final db = await open();
    return db.insert(tableAddDriver, addDriverModel.toMap());
  }

  static Future<int> insertBooking(BookingModel bookingModel) async {
    final db = await open();
    return db.insert(tableBooking, bookingModel.toMap());
  }

  static Future<List<AddCarModel>> getAllCar() async {
    final db = await open();
    final mapList =
        await db.query(tableAddCar, orderBy: '$tableAddCarColCarName asc');
    return List.generate(
        mapList.length, (index) => AddCarModel.fromMap(mapList[index]));
  }

  static Future<List<AddDriverModel>> getAllDriver() async {
    final db = await open();
    final mapList = await db.query(tableAddDriver, orderBy: '$tableAddCarColDriverName asc');
    return List.generate(
        mapList.length, (index) => AddDriverModel.fromMap(mapList[index]));
  }

  static Future<List<BookingModel>> getAllBooking() async {
    final db = await open();
    final mapList =
        await db.query(tableBooking, orderBy: '$tableBookingColName asc');
    return List.generate(
        mapList.length, (index) => BookingModel.fromMap(mapList[index]));
  }

  static Future<AddCarModel> getAddCarById(int id) async {
    final db = await open();
    final mapList = await db
        .query(tableAddCar, where: '$tableAddCarColId = ?', whereArgs: [id]);
    return AddCarModel.fromMap(mapList.first);
  }

  static Future<AddDriverModel> getAddDriverById(int id) async {
    final db = await open();
    final mapList = await db.query(tableAddDriver,
        where: '$tableAddDriverColId = ?', whereArgs: [id]);
    return AddDriverModel.fromMap(mapList.first);
  }

  static Future<BookingModel> getBookingById(int id) async {
    final db = await open();
    final mapList = await db.query(tableBooking,
        where: '$tableAddDriverColId = ?', whereArgs: [id]);
    return BookingModel.fromMap(mapList.first);
  }

  static Future<List<AddCarModel>> searchAllCarByName(
      String searchProvider) async {
    final db = await open();
    final mapList = await db.query(tableAddCar,
        where: '$tableAddCarColCarName=?',
        whereArgs: [searchProvider],
        orderBy: '$tableAddCarColCarName asc');
    return List.generate(
        mapList.length, (index) => AddCarModel.fromMap(mapList[index]));
  }

  static Future<int> deleteCarList(int id) async {
    final db = await open();
    return db
        .delete(tableAddCar, where: '$tableAddCarColId = ?', whereArgs: [id]);
  }

  static Future<int> deleteDriverList(int id) async {
    final db = await open();
    return db.delete(tableAddDriver,
        where: '$tableAddDriverColId = ?', whereArgs: [id]);
  }
}
