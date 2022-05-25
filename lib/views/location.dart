import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:sizer/sizer.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
          alignment: Alignment.center,
            child: Container(
              height: 85.h,
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getCurrentLocation();          // Add your onPressed code here!
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.gps_fixed),
      ),
    );
  }

  getCurrentLocation() {
    setState(() {
      mapController = MapController(
        initMapWithUserPosition: false,
        initPosition: GeoPoint(latitude: -6.174859070773143, longitude: 106.82730300369903),
      );
    });
  }
}
