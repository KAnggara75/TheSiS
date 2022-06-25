import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/m_board.dart';
import '../service/s_board.dart';
import '../service/s_location.dart';
import '../views/home/v_home.dart';
import 'dart:math';

abstract class HomeController extends State<HomeBody> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Timer timer;
  bool loading = false;
  String? token;
  late Future<Board> futureBoard;
  List<Control>? control = [];

  LocationService locationService = LocationService();

  double lon = 0;
  double lat = 0;
  bool locationStatus = false;
  bool isKm = false;

  @override
  void initState() {
    super.initState();
    loading = true;
    getPref();
    futureBoard = getBoardData(token);
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (t) => getPref(),
    );
    locationService.locationStream.listen((userLocation) {
      setState(() {
        lon = userLocation.longitude;
        lat = userLocation.latitude;
        locationStatus = true;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    locationService.dispose();
    super.dispose();
  }

  double harvesin(double lat1, double lon1) {
    const R = 6378137; // Earth Radius In metres
    late double lat2 = lat;
    late double lon2 = lon;

    double dLat = ((lat2 - lat1) * pi / 180) / 2;
    double dLon = ((lon2 - lon1) * pi / 180) / 2;

    var g = pow(dLat, 2);
    var h = pow(dLon, 2);
    var i = asin(sqrt(sin(g) + (cos(lat1) * cos(lat2) * sin(h))));

    double d = double.parse((2 * R * i).toStringAsFixed(2));
    if (d > 1000) {
      isKm = true;
      return double.parse((d / 1000).toStringAsFixed(2));
    } else {
      isKm = false;
      return d;
    }
  }

  getPref() async {
    SharedPreferences preferences = await _prefs;
    print("get");

    if (mounted) {
      setState(() {
        token = preferences.getString('token');
        futureBoard = getBoardData(token);
        control = [];
      });
    }
  }
}
