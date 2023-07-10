import 'package:attendance_system/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  DateTime? checkInTime;
  DateTime? checkOutTime;

  

  // Future<void> checkIn() async {
  //   final client = SupabaseClient(supabaseUrl, supabaseKey);
  //   final response = await Supabase.instance.client
  //       .from('attendance')
  //       .upsert([
  //         {'check_in': DateTime.now()}
  //       ])
  //       .execute();
  //   if (response.data == null) {
  //     setState(() {
  //       checkInTime = DateTime.now();
  //     });
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Check In Successful'),
  //           content: Text('You have successfully checked in at ${checkInTime.toString()}'),
  //           actions: [
  //             ElevatedButton(
  //               child: Text('OK'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Check In Failed'),
  //           content: Text('Failed to check in. Please try again.'),
  //           actions: [
  //             ElevatedButton(
  //               child: Text('OK'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }
  Future<void> checkIn() async {
  final client = SupabaseClient(supabaseUrl, supabaseKey);
  final response = Supabase.instance.client
      .from('attendance')
      .upsert([
        {'check_in': DateTime.now()}
      ])
      .then((response) {
    if (response.error == null) {
      setState(() {
        checkInTime = DateTime.now();
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Check In Successful'),
            content: Text('You have successfully checked in at ${checkInTime.toString()}'),
            actions: [
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Check In Failed'),
            content: Text('Failed to check in. Please try again.'),
            actions: [
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  });
}



  // Future<void> checkOut() async {
  //   final client = SupabaseClient(supabaseUrl, supabaseKey);
  //   final response = await Supabase.instance.client
  //       .from('attendance')
  //       .upsert([
  //         {'check_out': DateTime.now()}
  //       ])
  //       .execute();
  //   if (response.data == null) {
  //     setState(() {
  //       checkOutTime = DateTime.now();
  //     });
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Check Out Successful'),
  //           content: Text('You have successfully checked out at ${checkOutTime.toString()}'),
  //           actions: [
  //             ElevatedButton(
  //               child: Text('OK'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Check Out Failed'),
  //           content: Text('Failed to check out. Please try again.'),
  //           actions: [
  //             ElevatedButton(
  //               child: Text('OK'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  Future<void> checkOut() async {
  final client = SupabaseClient(supabaseUrl, supabaseKey);
  Supabase.instance.client
      .from('attendance')
      .upsert([
        {'check_out': DateTime.now()}
      ])
      .then((response) {
    if (response.error == null) {
      setState(() {
        checkOutTime = DateTime.now();
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Check Out Successful'),
            content: Text('You have successfully checked out at ${checkOutTime.toString()}'),
            actions: [
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Check Out Failed'),
            content: Text('Failed to check out. Please try again.'),
            actions: [
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance System'),
      ),
            body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: checkIn,
              child: Text('Check In'),
            ),
            SizedBox(height: 20),
            if (checkInTime != null)
              Text('Check In Time: ${checkInTime.toString()}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkOut,
              child: Text('Check Out'),
            ),
            SizedBox(height: 20),
            if (checkOutTime != null)
              Text('Check Out Time: ${checkOutTime.toString()}'),
          ],
        ),
      ),
    );
  }
}