import 'package:flutter/foundation.dart';
import 'package:renting_car/db/sqlf_lite.dart';
import 'package:renting_car/models/booking_model.dart';

class AddBookingProvider extends ChangeNotifier {
  List<BookingModel> addBookingList = [];

  getAllBookings() async {
    addBookingList = await DBHelper.getAllBooking();
    notifyListeners();
  }
  Future<BookingModel> getBookingsById(int id) => DBHelper.getBookingById(id);


  Future<bool> insertBookings(BookingModel addBookingModel) async {
    final rowId = await DBHelper.insertBooking(addBookingModel);
    if(rowId > 0) {
      addBookingModel.id = rowId;
      addBookingList.add(addBookingModel);
      // addCarList.sort((c1, c2) => c1.carName.compareTo(c2.carName));
      notifyListeners();
      return true;
    }
    return false;
  }
}