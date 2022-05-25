import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: text("Program Sederhana Ini")
            ),
            Container(
                child: text("Dibuat Oleh : \n\n")
            ),
            const CircleAvatar(
              radius: 110,
              backgroundImage: AssetImage('assets/me.png'),
            ),
            Column(
              children: [
                text("\n\nNama : Candra"),
                text("NIM : 20190801153"),
              ]
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Text text (msg){
    return Text(msg, style: TextStyle(
        color: Colors.black,
        fontSize: 20.sp
    ));
  }
}
