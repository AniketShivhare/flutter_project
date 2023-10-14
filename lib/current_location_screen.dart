// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class CurrentLocationScreen extends StatefulWidget {
//   const CurrentLocationScreen({super.key});
//
//   @override
//   State<CurrentLocationScreen> createState() => _CurrentLocationScreenState();
// }
//
// class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
//
//   late G
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("User Current Location"),
//         centerTitle: true,
//       ),
//       body: GoogleMap(initialCameraPosition: in,),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late GoogleMapController googleMapController;


  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(0, 0), zoom: 0);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop current location"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          try {
            Position position = await _determinePosition();

            googleMapController
                .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 14)));


            markers.clear();

            markers.add(Marker(markerId: const MarkerId('currentLocation'),
                position: LatLng(position.latitude, position.longitude)));

            setState(() {});
          }catch (e){
            print('Error: $e');
            _showLocationServiceDisabledDialog(context);
          }

        },
        label: const Text("Current Location"),
        icon: const Icon(Icons.location_history),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}


void _showLocationServiceDisabledDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Location Services Disabled'),
      content: const Text('Please enable location services to use this feature.'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            // Open location settings to allow the user to enable location services
            bool isOpened = await Geolocator.openLocationSettings();
            if (isOpened) {
              Navigator.of(context).pop(); // Close the dialog
            } else {
              // Location settings couldn't be opened
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Unable to open location settings. Please enable location services manually.'),
                ),
              );
            }
          },
          child: const Text('Enable Location'),
        ),
      ],
    ),
  );
}


//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class CurrentLocationScreen extends StatefulWidget {
//   const CurrentLocationScreen({Key? key}) : super(key: key);
//
//   @override
//   _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
// }
//
// class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
//
//   static const CameraPosition initialCameraPosition = CameraPosition(
//       target: LatLng(0, 0), zoom: 0);
//
//   late GoogleMapController googleMapController;
//   Set<Marker> markers = {};
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Shop current location"),
//         centerTitle: true,
//       ),
//       body: GoogleMap(
//         // No initialCameraPosition specified
//         markers: markers,
//         zoomControlsEnabled: false,
//         mapType: MapType.normal,
//         onMapCreated: (GoogleMapController controller) async {
//           googleMapController = controller;
//           await _moveToCurrentLocation();
//         },
//         initialCameraPosition: initialCameraPosition,
//       ),
//       // floatingActionButton: FloatingActionButton.extended(
//       //   onPressed: () async {
//       //     try {
//       //       await _moveToCurrentLocation();
//       //     } catch (e) {
//       //       print('Error: $e');
//       //       _showLocationServiceDisabledDialog(context);
//       //     }
//       //   },
//       //   label: const Text("Current Location"),
//       //   icon: const Icon(Icons.location_history),
//       // ),
//     );
//   }
//
//
//   Future<void> _moveToCurrentLocation() async {
//     try {
//       Position position = await _determinePosition();
//
//       googleMapController.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(
//             target: LatLng(position.latitude, position.longitude),
//             zoom: 14,
//           ),
//         ),
//       );
//
//       markers.clear();
//       markers.add(
//         Marker(
//           markerId: const MarkerId('currentLocation'),
//           position: LatLng(position.latitude, position.longitude),
//         ),
//       );
//
//       setState(() {});
//     } catch (e) {
//       throw Exception('Unable to determine current location: $e');
//     }
//   }
//
//   Future<Position> _determinePosition() async {
//     // ... (existing code)
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled');
//     }
//
//     permission = await Geolocator.checkPermission();
//
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//
//       if (permission == LocationPermission.denied) {
//         return Future.error("Location permission denied");
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('Location permissions are permanently denied');
//     }
//
//     Position position = await Geolocator.getCurrentPosition();
//
//     return position;
//   }
//
//
//
// }






//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class CurrentLocationScreen extends StatefulWidget {
//   const CurrentLocationScreen({Key? key}) : super(key: key);
//
//   @override
//   _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
// }
//
// class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
//
//   static const CameraPosition initialCameraPosition = CameraPosition(
//       target: LatLng(0, 0), zoom: 0);
//
//   late GoogleMapController googleMapController;
//   Set<Marker> markers = {};
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Shop current location"),
//         centerTitle: true,
//       ),
//       body: GoogleMap(
//         // No initialCameraPosition specified
//         markers: markers,
//         zoomControlsEnabled: false,
//         mapType: MapType.normal,
//         onMapCreated: (GoogleMapController controller) async {
//           googleMapController = controller;
//           await _moveToCurrentLocation();
//         },
//         initialCameraPosition: initialCameraPosition,
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () async {
//           try {
//             await _moveToCurrentLocation();
//           } catch (e) {
//             print('Error: $e');
//             // Handle error if needed
//           }
//         },
//         label: const Text("Current Location"),
//         icon: const Icon(Icons.location_history),
//       ),
//     );
//   }
//
//   Future<void> _moveToCurrentLocation() async {
//     try {
//       // Assume location permission has already been granted
//       // Use your logic for fetching the current position here
//       Position position = await _determinePosition();
//
//       googleMapController.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(
//             target: LatLng(position.latitude, position.longitude),
//             zoom: 14,
//           ),
//         ),
//       );
//
//       markers.clear();
//       markers.add(
//         Marker(
//           markerId: const MarkerId('currentLocation'),
//           position: LatLng(position.latitude, position.longitude),
//         ),
//       );
//
//       setState(() {});
//     } catch (e) {
//       print('Error: $e');
//       throw Exception('Unable to determine current location: $e');
//     }
//   }
//
//   Future<Position> _determinePosition() async {
//     // Your logic for determining the position
//     // This could involve Geolocator or other location services
//     // For demonstration, we'll simulate a position
//     return Position(
//       latitude: 37.7749,
//       longitude: -122.4194,
//     );
//   }
//
//   void _showLocationServiceDisabledDialog(BuildContext context) {
//     // ... (existing code)
//     showDialog(
//       context: context,
//       builder: (context) =>
//           AlertDialog(
//             title: const Text('Location Services Disabled'),
//             content: const Text(
//                 'Please enable location services to use this feature.'),
//             actions: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); // Close the dialog
//                 },
//                 child: const Text('Cancel'),
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   // Open location settings to allow the user to enable location services
//                   // Assume location permission is already granted
//                   // Replace with your logic to handle location settings
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: const Text('Location settings opened.'),
//                     ),
//                   );
//                 },
//                 child: const Text('Enable Location'),
//               ),
//             ],
//           ),
//     );
//   }
// }


