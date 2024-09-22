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


   ///custom info windows  start..............................................................................................

   CustomInfoWindowController customInfoWindowController=CustomInfoWindowController();
   Set<Marker> marker={};
   List<LatLng> latlngList=[

     LatLng(23.7934712, 90.3645558),
     LatLng(23.791439,90.3625738),
     LatLng(23.7880348,90.3653746),
   ];

   List<String> imageList=[
        "https://mysoftheaven.com/gallery_img/65d4a1ff231b6_d.jpg",
        "https://arabiconline.eu/wp-content/uploads/2023/08/sur_mosque-1080x675.jpg",
        "https://i.natgeofe.com/n/010bbba8-f1e5-4b80-92f7-b4bb263ceaf0/sultan-ahmed-mosque-istanbul-turkey.jpg",
   ];

   List<String> nameList=[
     "Mysoft Heaven BD LTD",
     "Sapra Mosque",
     "Paka Mosque",

    ];

   displayInfo(){
     for(int i=0; i<latlngList.length;i++){
       marker.add(
         Marker(markerId: MarkerId(i.toString()),
             icon: BitmapDescriptor.defaultMarker,
             position: latlngList[i],
             onTap: (){

               customInfoWindowController.addInfoWindow!(
                 Container(
                   decoration: BoxDecoration(
                       color: Colors.white
                   ),
                   child: Column(
                     children: [
                       Image.network(imageList[i],
                         height: 120,width: 250,
                         fit: BoxFit.fill,
                       ),
                       Text(nameList[i],
                         style: TextStyle(color: Colors.green,
                             fontSize: 16,
                             fontWeight: FontWeight.w500
                         ),
                       )
                     ],
                   ),
                 ),
                 latlngList[i],
               );
             }
         ),

       );
     }

     setState(() {

     });

   }

   ///custom info windows end....................................................................................................


   @override
  void initState() {
     displayInfo();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: myCurrentLocation,zoom: 15,),
            markers: marker,
            onMapCreated: (GoogleMapController controller){
              customInfoWindowController.googleMapController=controller;
            },

          ),
          CustomInfoWindow(
            controller: customInfoWindowController,
            height: 160,
            width: 255,
            offset: 40,
          )


        ],
      ),

    );
  }
}