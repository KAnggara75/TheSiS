import 'dart:async';
import '../models/user_location.dart';
import 'package:location/location.dart';

class LocationService {
  Location location = Location();
  final StreamController<UserLocation> _locationStreamController =
      StreamController<UserLocation>();

  Stream<UserLocation> get locationStream => _locationStreamController.stream;

  LocationService() {
    location.requestService().then((status) async {
      while (!status) {
        status = await location.requestService();
        await Future.delayed(const Duration(seconds: 2));
      }
      location.requestPermission().then((permision) async {
        while (permision != PermissionStatus.granted) {
          permision = await location.requestPermission();
          await Future.delayed(const Duration(seconds: 2));
        }
        if (permision == PermissionStatus.granted) {
          location.onLocationChanged.listen((locationData) {
            // do nothing if already disposed
            if (_isDisposed) {
              return;
            } else {
              _locationStreamController.add(UserLocation(
                latitude: locationData.latitude!.toDouble(),
                longitude: locationData.longitude!.toDouble(),
              ));
            }
          });
        } else if (permision == PermissionStatus.denied) {
          _locationStreamController.add(UserLocation(
            longitude: 0.0,
            latitude: 0.0,
          ));
        }
      });
    });
  }

  bool _isDisposed = false;
  void dispose() {
    _locationStreamController.close();
    _isDisposed = true;
  }
}
