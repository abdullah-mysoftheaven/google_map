import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapFlutter extends StatefulWidget{

  GoogleMapFlutter({super.key});

  @override
  State<GoogleMapFlutter> createState() => _GoogleMapFlutterState();


}

class _GoogleMapFlutterState extends State<GoogleMapFlutter> {

   LatLng myCurrentLocation= const LatLng(23.7934712, 90.3645558);
   @override
  void initState() {

    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: myCurrentLocation,zoom: 15,),
          ),

        ],
      ),

    );
  }
}