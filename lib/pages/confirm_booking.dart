import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renting_car/pages/booking_page.dart';
import 'package:renting_car/provider/booking_provider.dart';

class ConfirmBooking extends StatefulWidget {
  static const routeName = '/confirmBooking';

  const ConfirmBooking({Key? key}) : super(key: key);

  @override
  State<ConfirmBooking> createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {
  late double rentAmount;

  @override
  void didChangeDependencies() {
    rentAmount = ModalRoute.of(context)!.settings.arguments as double;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Booking Page"),
      ),
      body: Consumer<AddBookingProvider>(
          builder: (context, provider, _) => ListView.builder(
              itemCount: provider.addBookingList.length,
              itemBuilder: (context, index) {
                final booking = provider.addBookingList[index];
                return Card(
                  child: Column(
                    children: [
                      Text("$rentAmount"),
                      SizedBox(
                        height: 20,
                      ),
                      Text(booking.userName),
                      SizedBox(
                        height: 20,
                      ),
                      Text(booking.userNumber),
                      SizedBox(
                        height: 20,
                      ),
                      Text(booking.userEmail!),
                      SizedBox(
                        height: 20,
                      ),
                      Text(booking.userFrom),
                      SizedBox(
                        height: 20,
                      ),
                      Text(booking.userTo),
                      SizedBox(
                        height: 20,
                      ),
                      Text(booking.rentDate),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            text: "Your transaction was successful!",
                          );
                        },
                        child:
                            const Text('Click to confirm Your BOOKING......'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurple,
                            fixedSize: const Size(100, 70),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
