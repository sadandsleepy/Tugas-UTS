import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:tugas/helper.dart';
import 'package:sizer/sizer.dart';
import 'package:tugas/profile.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helper/helper.dart';
import '../screencall.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    gettingLocation();
  }

  var location = "Jakarta, ID";

  final List<String> imgList = [
    "assets/vaksin.jpg",
    "assets/antigen.jpg",
    "assets/pcr.jpg",
    "assets/kamar.jpg",
    "assets/gejala.jpg",

  ];
  final List<String> keluhan = [
    "Vaksinasi",
    "Test Antigen",
    "Test PCR",
    "Kamar Rawat",
    "Gejala Awal"
  ];
  final List<String> site =[
    "https://www.google.com/search?q=daftar+vaksin+covid",
    "https://www.google.com/search?q=daftar+tes+antigen",
    "https://www.google.com/search?q=daftar+tes+pcr",
    "https://www.google.com/search?q=kamar+rawat+covid",
    "https://www.google.com/search?q=gejala+awal+covid"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Profile()));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.person, size: 4.h, color: const Color(0xffDC143C)),
                          Column(
                              children: [
                                Text("Hello, Candra!", style: TextStyle(fontSize: 10.sp),),
                                Text("Check your profile!", style: TextStyle(fontSize: 10.sp, color: const Color(0xffDC143C)),)
                              ],
                          )
                        ],
                      ),
                    ),
                   GestureDetector(
                     onTap: (){

                     },
                     child:  Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Column(
                           children: [
                             Text(location, style: TextStyle(fontSize: 10.sp),),
                             Text("Check your location history", style: TextStyle(fontSize: 10.sp, color: const Color(0xffDC143C))),
                           ],
                         ),
                         Icon(Icons.location_on_outlined, size: 3.5.h, color: const Color(0xffDC143C))
                       ],
                     ),
                   ),
                  ],
                ),
              ),
              Container(
                height: 15.h,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Butuh Bantuan Darurat?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25.sp)),
                    Text("\nSilahkan pilih kategori untuk konsultasi",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10.sp, color: const Color(0xff878995))),
                  ],
                ),
              ),
              Container(
                height: 20.h,
                alignment: Alignment.center,
                child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2,
                      enlargeCenterPage: true,
                    ),
                    items: imgList.map((item) => Container(
                      margin: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: (){
                          toast(keluhan[imgList.indexOf(item)]);
                          launchURL(site[imgList.indexOf(item)]);
                        },
                        child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Text(keluhan[imgList.indexOf(item)],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    )).toList()
                ),
              ),
              Container(
                height: 15.h,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text("Tidak terdapat kategori yang anda butuhkan?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.sp)),
                    Text("\nSilahkan tahan tombol untuk memanggil tanaga kesehatan",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10.sp, color: const Color(0xff878995))),
                  ],
                ),
              ),
              GestureDetector(
                onLongPress: (){
                  toast("Getting location on progress");
                  gettingLocation();
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ScreenCall()));
                  toast("Sending location to paramedic");
                },
                child: CircleAvatar(
                  radius: 9.h,
                  backgroundColor: const Color(0xffB22222),
                  child: CircleAvatar(
                    radius: 8.h,
                    backgroundColor: const Color(0xffDC143C),
                    child: CircleAvatar(
                      radius: 7.h,
                      backgroundColor: const Color(0xffFF0000),
                      child: Icon(Icons.call_outlined, size: 7.h,),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  gettingLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> addresses = await placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      location = addresses[0].locality.toString();
      toast("Location updated");
    });
  }
}
