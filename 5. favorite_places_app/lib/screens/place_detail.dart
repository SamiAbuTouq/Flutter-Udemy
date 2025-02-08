import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng2;

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Hero(
            tag: place.id,
            child: Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => MapScreen(
                            location: place.location,
                            isSelecting: false,
                          ),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 70,
                      child: ClipOval(
                        child: SizedBox(
                          width: 140,
                          height: 140,
                          child: FlutterMap(
                            options: MapOptions(
                              interactiveFlags: InteractiveFlag.none,
                              center: latLng2.LatLng(place.location.latitude,
                                  place.location.longitude),
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
                                        place.location.latitude,
                                        place.location.longitude),
                                    builder: (context) => const Icon(
                                      Icons.location_on,
                                      size: 30,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    child: Text(
                      place.location.address,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 35))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
