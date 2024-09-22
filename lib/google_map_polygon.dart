import 'dart:async';
import 'dart:collection';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPolygonFlutter extends StatefulWidget{

  const GoogleMapPolygonFlutter({super.key});

  @override
  State<GoogleMapPolygonFlutter> createState() => _GoogleMapPolygonFlutterState();


}

class _GoogleMapPolygonFlutterState extends State<GoogleMapPolygonFlutter> {

   LatLng myCurrentLocation= const LatLng(23.831005, 90.565159);


   final Completer<GoogleMapController> _completer = Completer();
   Set<Marker> marker={};
   Set<Polygon> polygon=HashSet<Polygon>();

   ///custom info windows  start..............................................................................................

   CustomInfoWindowController customInfoWindowController=CustomInfoWindowController();

   List<LatLng> latlngList=[

     const LatLng(23.829189, 90.562891),
     const LatLng(23.828235, 90.564038),
     const LatLng(23.828757, 90.565080),
     const LatLng(23.828830, 90.566782),
     const LatLng(23.830989, 90.566857),
     const LatLng(23.831005, 90.565159),
     const LatLng(23.831028, 90.562071),
     const LatLng(23.829189, 90.562891),

   ];



   displayMarker(){
     for(int i=0; i<latlngList.length;i++){
       marker.add(
         Marker(markerId: MarkerId(i.toString()),
             icon: BitmapDescriptor.defaultMarker,
             position: latlngList[i],

         ),

       );
     }

     setState(() {

     });

   }
   
   addPolygon(){
     polygon.add(
         Polygon(
             polygonId: PolygonId("id"),
            points:latlngList ,
            fillColor: Colors.green,
           strokeColor: Colors.red,
           strokeWidth: 5,
           geodesic: true

         ));
   }

   ///custom info windows end....................................................................................................


   @override
  void initState() {
     // displayMarker();
     addPolygon();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:  GoogleMap(
        initialCameraPosition: CameraPosition(target: myCurrentLocation,zoom: 16,),
        markers: marker,
        polygons: polygon,
        onMapCreated: (GoogleMapController controller){
          customInfoWindowController.googleMapController = controller;
          _completer.complete(controller);
        },

      ),

    );
  }
}