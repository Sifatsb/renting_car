class AddCarModel {
  int? id;
  int? driverId;
  String carName;
  String? carImage;
  String carNumber;
  String carCapacity;
  String carDriverName;
  String? carManufacturer;

  AddCarModel(
      {this.id,
        this.driverId,
      required this.carName,
      this.carImage,
      required this.carNumber,
      required this.carCapacity,
      required this.carDriverName,
      this.carManufacturer});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      tableAddCarColCarName: carName,
      tableAddCarColCarNumber: carNumber,
      tableAddCarColCarCapacity: carCapacity,
      tableAddCarColCarDriverName: carDriverName,
      tableAddCarColCarManufacturer: carManufacturer,
      tableAddCarColCarImage: carImage,
      tableAddCarColDriverId: driverId,
    };
    if (id != null) {
      map[tableAddCarColId] = id;
    }
    return map;
  }

  factory AddCarModel.fromMap(Map<String, dynamic> map) => AddCarModel(
        id: map[tableAddCarColId],
        driverId: map[tableAddCarColDriverId],
        carName: map[tableAddCarColCarName],
        carNumber: map[tableAddCarColCarNumber],
        carCapacity: map[tableAddCarColCarCapacity],
        carDriverName: map[tableAddCarColCarDriverName],
        carManufacturer: map[tableAddCarColCarManufacturer],
        carImage: map[tableAddCarColCarImage],
      );
}

const String tableAddCar = 'tbl_add_car';
const String tableAddCarColId = 'id';
const String tableAddCarColDriverId= 'driver_id';
const String tableAddCarColCarName = 'carName';
const String tableAddCarColCarNumber = 'carNumber';
const String tableAddCarColCarCapacity = 'carCapacity';
const String tableAddCarColCarDriverName = 'driver_name';
const String tableAddCarColCarManufacturer = 'carManufacturer';
const String tableAddCarColCarImage = 'carImage';
