import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:sizer/sizer.dart';
import '../helper/helper.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController search = TextEditingController();
  MapController mapController = MapController();

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
                decoration: backgroundDecoration(0xffA9A9A9),
                child: TextField(
                  controller: search,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(2.h),
                      hintText: "Cari Rumah Sakit/Klinik terdekat",
                      suffixIcon: const Icon(Icons.search)
                  ),
                ),
              ),
              SizedBox(height : 3.h),
              Container(
                height: 75.h,
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: OSMFlutter(
                  controller:mapController,
                  trackMyPosition: false,
                  initZoom: 12,
                  minZoomLevel: 8,
                  maxZoomLevel: 14,
                  stepZoom: 1.0,
                  userLocationMarker: UserLocationMaker(
                    personMarker: const MarkerIcon(
                      icon: Icon(
                        Icons.location_history_rounded,
                        color: Colors.red,
                        size: 48,
                      ),
                    ),
                    directionArrowMarker: const MarkerIcon(
                      icon: Icon(
                        Icons.double_arrow,
                        size: 48,
                      ),
                    ),
                  ),
                  roadConfiguration: RoadConfiguration(
                    startIcon: const MarkerIcon(
                      icon: Icon(
                        Icons.person,
                        size: 64,
                        color: Colors.brown,
                      ),
                    ),
                    roadColor: Colors.yellowAccent,
                  ),
                  markerOption: MarkerOption(
                      defaultMarker: const MarkerIcon(
                        icon: Icon(
                          Icons.person_pin_circle,
                          color: Colors.blue,
                          size: 56,
                        ),
                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
