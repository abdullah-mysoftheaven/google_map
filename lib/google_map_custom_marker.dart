import 'dart:async';
import 'dart:collection';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapCustomMarkerFlutter extends StatefulWidget{

  const GoogleMapCustomMarkerFlutter({super.key});

  @override
  State<GoogleMapCustomMarkerFlutter> createState() => _GoogleMapCustomMarkerFlutterState();


}

class _GoogleMapCustomMarkerFlutterState extends State<GoogleMapCustomMarkerFlutter> {

   LatLng myCurrentPosition= const LatLng(23.792220, 90.374927);

   BitmapDescriptor customIcon=BitmapDescriptor.defaultMarker;

   customMarker(){
     BitmapDescriptor.asset(const ImageConfiguration(), "assets/marker_Icon.png")
         .then((icon){
            setState(() {
              customIcon=icon;
            });
     });
   }

   @override
  void initState() {
     customMarker();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:  GoogleMap(
        initialCameraPosition: CameraPosition(target: myCurrentPosition,zoom: 14,),
        markers: {
          Marker(markerId: MarkerId("Marker Id"),
              icon: customIcon,
              position: myCurrentPosition,
              draggable: true,
              onDrag: (value){
                // myCurrentPosition=value;
              },
              infoWindow: const InfoWindow(
                  title: "this is beautiful place",
                  snippet: "So beautiful"
              )

          )
        },
        myLocationButtonEnabled: false,



      ),

    );
  }
}