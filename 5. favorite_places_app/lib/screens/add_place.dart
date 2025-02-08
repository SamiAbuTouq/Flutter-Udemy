import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart' as geo;

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  Future<List> getLocationAddress(double latitude, double longitude) async {
    List<geo.Placemark> placemark =
        await geo.placemarkFromCoordinates(latitude, longitude);
    return placemark;
  }

  void _selectPlace(double latitude, double longitude) async {
    final addressData = await getLocationAddress(latitude, longitude);

    final String street = addressData[0].street ?? '';
    final String postalcode = addressData[0].postalCode ?? '';
    final String locality = addressData[0].locality ?? '';
    final String country = addressData[0].country ?? '';
    final String address = '$street, $postalcode, $locality, $country';

    setState(() {
      _selectedLocation = PlaceLocation(
          latitude: latitude, longitude: longitude, address: address);
    });
  }

  void _savePlace() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty ||
        _selectedImage == null ||
        _selectedLocation == null) {
      return;
    }

    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredTitle, _selectedImage!, _selectedLocation!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  labelText: 'Title',
                  fillColor: const Color.fromARGB(70, 255, 255, 255)),
              controller: _titleController,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(height: 12),
            LocationInput(onSelectPlace: _selectPlace),
            const SizedBox(height: 18),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(70, 255, 255, 255),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
              onPressed: _savePlace,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: const Text(
                'Add Place',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
