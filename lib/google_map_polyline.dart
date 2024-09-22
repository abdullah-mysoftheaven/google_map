import 'dart:async';
import 'dart:collection';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPolylineFlutter extends StatefulWidget{

  const GoogleMapPolylineFlutter({super.key});

  @override
  State<GoogleMapPolylineFlutter> createState() => _GoogleMapPolylineFlutterState();


}

class _GoogleMapPolylineFlutterState extends State<GoogleMapPolylineFlutter> {

   LatLng myCurrentLocation= const LatLng(23.792220, 90.374927
   );


   final Completer<GoogleMapController> _completer = Completer();
   Set<Marker> marker={};
   final Set<Polyline> _polyline={};


   List<LatLng> latlngList=[
     const LatLng(23.792220, 90.374927),
     const LatLng(23.803744, 90.370097),

     //same to 5th item
     const LatLng(23.807037, 90.368405),

     const LatLng(23.799271, 90.354040),

     //same to 3rd item
     const LatLng(23.807037, 90.368405),


     const LatLng(23.811834, 90.367354),



   ];
   List<LatLng> latlngList12=[
     const LatLng(28.568787, 81.629243),
     const LatLng(28.579754, 81.633865),
     //same to 5th item
     const LatLng(28.591831, 81.616543),
     const LatLng(28.600745, 81.613678),
     //same to 3rd item
     const LatLng(28.591831, 81.616543),
     const LatLng(28.600792, 81.596041)



   ];



   displayMarkerAndAddPolyLine(){
     for(int i=0; i<latlngList.length;i++){
       marker.add(
         Marker(markerId: MarkerId(i.toString()),
             icon: BitmapDescriptor.defaultMarker,
             position: latlngList[i],
           infoWindow: InfoWindow(
             title: "this is beautiful place",
             snippet: "So beautiful"
           )

         ),

       );
     }

     setState(() {
       _polyline.add(
           Polyline(
               polylineId: PolylineId("Id"),
               points:latlngList ,
               color: Colors.green,
               width: 5,

               // strokeColor: Colors.red,
               // strokeWidth: 5,
               // geodesic: true

           ));
     });

   }
   


   ///custom info windows end....................................................................................................


   @override
  void initState() {
     displayMarkerAndAddPolyLine();

    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:  GoogleMap(
        initialCameraPosition: CameraPosition(target: myCurrentLocation,zoom: 14,),
        markers: marker,
        myLocationButtonEnabled: false,
        polylines: _polyline,


      ),

    );
  }
}