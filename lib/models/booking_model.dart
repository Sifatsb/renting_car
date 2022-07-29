class BookingModel {

  int? id;
  String userName;
  String userNumber;
  String? userEmail;
  String userFrom;
  String userTo;
  String rentDate;
  String? gender;


  BookingModel(
      {this.id, required this.userName, required this.userNumber, this.userEmail,
        required this.userFrom, required this.userTo, required this.rentDate, this.gender});


  @override
  String toString() {
    return 'BookingModel{id: $id, userName: $userName, userNumber: $userNumber, userEmail: $userEmail, userFrom: $userFrom, userTo: $userTo, rentDate: $rentDate, gender: $gender}';
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      tableBookingColName: userName,
      tableBookingColNumber: userNumber,
      tableBookingColEmail: userEmail,
      tableBookingColUserFrom: userFrom,
      tableBookingColUserTo: userTo,
      tableBookingColGender: gender,
      tableBookingColRentDate: rentDate,
    };
    if (id != null) {
      map[tableBookingColId] = id;
    }
    return map;
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) =>
      BookingModel(
          id: map[tableBookingColId],
          userName: map[tableBookingColName],
          userNumber: map[tableBookingColNumber],
          userEmail: map[tableBookingColEmail],
          userFrom: map[tableBookingColUserFrom],
          userTo: map[tableBookingColUserTo],
          gender: map[tableBookingColGender],
          rentDate: map[tableBookingColRentDate]
      );


}


const String tableBooking = 'tbl_booking';
const String tableBookingColId = 'id';
const String tableBookingColName = 'userName';
const String tableBookingColNumber = 'userNumber';
const String tableBookingColEmail = 'userEmail';
const String tableBookingColUserFrom = 'userFrom';
const String tableBookingColUserTo = 'userTo';
const String tableBookingColGender = 'gender';
const String tableBookingColRentDate = 'rentDate';


