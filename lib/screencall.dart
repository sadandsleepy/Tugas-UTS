import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'dashboard.dart';
import 'helper.dart';
import 'helper/helper.dart';

class ScreenCall extends StatefulWidget {
  const ScreenCall({Key? key}) : super(key: key);

  @override
  _ScreenCallState createState() => _ScreenCallState();
}

class _ScreenCallState extends State<ScreenCall> {

  final double size = 190;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Column(
                  children: [
                    Text(
                      "Paramedic",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.black),
                    ),
                    SizedBox(height : 2.h),
                    const Text(
                      "Calling…",
                      style: TextStyle(color: Colors.black12),
                    ),
                  ],
                )
              ),
              SizedBox(height: 2.h,),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.red.withOpacity(0.9),
                      Colors.red.withOpacity(0.5)
                    ],
                    stops: const [.5, 1],
                  ),
                ),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: Icon(Icons.apartment_outlined, size: 20.h,)
                ),
              ),
              SizedBox(height: 2.h,),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  DialButton(
                    iconSrc: "assets/icons/Icon Mic.svg",
                    text: "Audio",
                    press: () {},
                  ),
                  DialButton(
                    iconSrc: "assets/icons/Icon Volume.svg",
                    text: "Microphone",
                    press: () {},
                  ),
                  DialButton(
                    iconSrc: "assets/icons/Icon Video.svg",
                    text: "Video",
                    press: () {},
                  ),
                  DialButton(
                    iconSrc: "assets/icons/Icon Message.svg",
                    text: "Message",
                    press: () {},
                  ),
                  DialButton(
                    iconSrc: "assets/icons/Icon User.svg",
                    text: "Add contact",
                    press: () {},
                  ),
                  DialButton(
                    iconSrc: "assets/icons/Icon Voicemail.svg",
                    text: "Voice mail",
                    press: () {},
                  ),
                ],
              ),
              SizedBox(height: 2.h,),
              GestureDetector(
                onTap: (){
                  toast("Call Ended");
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Dashboard()));
                },
                child: CircleAvatar(
                  radius: 5.h,
                  backgroundColor: const Color(0xffFF0000),
                  child: Icon(Icons.call_end, size: 7.h,),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
