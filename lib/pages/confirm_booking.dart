
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text("Confirm Booking Page"),
      ),
      body: Consumer<AddBookingProvider>(
          builder: (context, provider, _) => ListView.builder(

              itemCount: provider.addBookingList.length,
              itemBuilder: (context, index) {
                final booking = provider.addBookingList[index];

                return Card(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(

                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  const Text("Rent Amount", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
                                  Text("$rentAmount\$", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),

                                ],
                              ),
                              const SizedBox(height: 10,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  const Text("UserName:", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
                                  Text(booking.userName, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),

                                ],
                              ),
                              const SizedBox(height: 10,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  const Text("User Number:", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
                                  Text(booking.userNumber, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),

                                ],
                              ),
                              const SizedBox(height: 10,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  const Text("User Email:", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
                                  Text("${booking.userEmail}", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),

                                ],
                              ),
                              const SizedBox(height: 10,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  const Text("Current Location:", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
                                  Text(booking.userFrom, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),

                                ],
                              ),
                              const SizedBox(height: 10,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  const Text("Destination:", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
                                  Text(booking.userTo, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),

                                ],
                              ),
                              const SizedBox(height: 10,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  const Text("Rent Date:", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
                                  Text(booking.rentDate, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),

                                ],
                              ),
                              const SizedBox(height: 10,),

                            ],
                          ),

                          const SizedBox(height: 60,),

                          ElevatedButton(
                            onPressed: () {
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.success,
                                text: "Your transaction was successful!",
                              );
                              setState(() {
                                provider.addBookingList.clear();
                              });

                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                fixedSize: const Size(350, 80),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            child:
                            const Text('Click to confirm Your BOOKING......', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                          ),


                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
