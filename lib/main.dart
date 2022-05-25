import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tugas/helper.dart';
import 'package:tugas/dashboard.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Emergency App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.primaries.first,
              scaffoldBackgroundColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: const PermissionHandlerScreen(),
          );
        }
    );
  }
}

class PermissionHandlerScreen extends StatefulWidget {
  const PermissionHandlerScreen({Key? key}) : super(key: key);

  @override
  _PermissionHandlerScreenState createState() =>
      _PermissionHandlerScreenState();
}

class _PermissionHandlerScreenState extends State<PermissionHandlerScreen> {
  @override
  void initState() {
    super.initState();
    permissionServiceCall();
  }

  permissionServiceCall() async {
    final status = await Permission.location.request();

    await permissionServices().then(
          (value) {
        if (status == PermissionStatus.granted) {
          toast("Permission Granted");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Dashboard()),
          );
        }
      },
    );
  }

  Future<Map<Permission, PermissionStatus>> permissionServices() async {
    final status = await Permission.location.request();
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
    ].request();

    if (status == PermissionStatus.permanentlyDenied) {
      toast("Please Allow Requested Permission");
      await openAppSettings().then(
            (value) async {
          if (value) {
            if (await Permission.location.isPermanentlyDenied == true &&
                await Permission.location.isGranted == false) {
              toast("Please Allow Manually Requested Permission From Settings");
              openAppSettings();
            }
          }
        },
      );
    }
    return statuses;
  }

  @override
  Widget build(BuildContext context) {
    permissionServiceCall();
    return const Scaffold(
        body: Center()
      );
  }
}
