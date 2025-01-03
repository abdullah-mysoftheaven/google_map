import 'package:flutter/material.dart';

import 'google_map.dart';
import 'google_map_custom_marker.dart';
import 'google_map_polygon.dart';
import 'google_map_polyline.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:   const GoogleMapCustomMarkerFlutter(),
    );
  }

}
