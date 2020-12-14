import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'networking.dart';

const apiKey = 'AIzaSyAjCsqfpqU_pJKzWrXLY-JNDjGM0MVaqko';
const googlemapURL = 'https://www.googleapis.com/geolocation/v1/geolocate?key=';

class MapModel{

  Future<dynamic> getLocation(String locationName)async {
    NetworkHelper networkHelper = NetworkHelper('$googlemapURL?key=$apiKey&units=metric');

    var locationData = await networkHelper.getData();
    return locationData;
  }

  String networkCheck(Location location){


  }

}