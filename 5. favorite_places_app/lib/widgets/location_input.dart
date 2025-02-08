import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng2;

import 'package:favorite_places/screens/map.dart';
import 'package:favorite_places/models/place.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectPlace});

  final Function onSelectPlace;

  @override
  State<LocationInput> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  late final MapController mapController;
  var _isGettingLocation = false;

  @override
  void initState() {
    mapController = MapController();
    super.initState();
  }

  Future<List> getLocationAddress(double latitude, double longitude) async {
    List<geo.Placemark> placemark =
        await geo.placemarkFromCoordinates(latitude, longitude);
    return placemark;
  }

  Future<void> _savePlace(double latitude, double longitude) async {
    final addressData = await getLocationAddress(latitude, longitude);
    final String street = addressData[0].street;
    final String postalcode = addressData[0].postalCode;
    final String locality = addressData[0].locality;
    final String country = addressData[0].country;
    final String address = '$street, $postalcode, $locality, $country';

    setState(() {
      _pickedLocation = PlaceLocation(
        latitude: latitude,
        longitude: longitude,
        address: address,
      );
      _isGettingLocation = false;
    });

    mapController.move(
      latLng2.LatLng(latitude, longitude),
      13.0,
    );

    widget.onSelectPlace(_pickedLocation!.latitude, _pickedLocation!.longitude);
  }

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;

    if (lat == null || lng == null) {
      return;
    }

    _savePlace(lat, lng);
  }

  Future<void> _selectOnMap() async {
    final pickedLocation = await Navigator.of(context).push<latLng2.LatLng>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => const MapScreen(
          isSelecting: true,
        ),
      ),
    );

    if (pickedLocation == null) {
      return;
    }

    _savePlace(pickedLocation.latitude, pickedLocation.longitude);
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'No location chosen',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
    );

    if (_pickedLocation != null) {
      previewContent = FlutterMap(
        mapController: mapController,
        options: MapOptions(
          interactiveFlags: InteractiveFlag.none,
          center: latLng2.LatLng(
              _pickedLocation!.latitude, _pickedLocation!.longitude),
          zoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://{s}.google.com/vt/lyrs=m&hl={hl}&x={x}&y={y}&z={z}',
            additionalOptions: const {'hl': 'en'},
            subdomains: const ['mt0', 'mt1', 'mt2', 'mt3'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: latLng2.LatLng(
                    _pickedLocation!.latitude, _pickedLocation!.longitude),
                builder: (context) => const Icon(
                  Icons.location_on,
                  size: 32,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      );
    }

    if (_isGettingLocation) {
      previewContent = const CircularProgressIndicator();
    }

    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.white,
            ),
          ),
          child: previewContent,
        ),
        const SizedBox(
          height: 9,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: const Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              label: const Text(
                'Get Current Location',
              ),
              onPressed: _getCurrentLocation,
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.map,
                color: Colors.white,
              ),
              label: const Text('Select on Map'),
              onPressed: _selectOnMap,
            ),
          ],
        ),
      ],
    );
  }
}
