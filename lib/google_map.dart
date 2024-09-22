import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapFlutter extends StatefulWidget{

  GoogleMapFlutter({super.key});

  @override
  State<GoogleMapFlutter> createState() => _GoogleMapFlutterState();


}

class _GoogleMapFlutterState extends State<GoogleMapFlutter> {

   LatLng myCurrentLocation= LatLng(23.6850,90.3563);
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: GoogleMap(initialCameraPosition: CameraPosition(target: myCurrentLocation)),

    );
  }
}