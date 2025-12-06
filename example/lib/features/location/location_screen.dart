import 'package:example/features/location/location_manager.dart';
import 'package:example/features/location/widgets/location_detail.dart';
import 'package:example/features/location/widgets/search_field.dart';
import 'package:example/features/location/widgets/search_result.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<Location> _searchResults = [];
  Location? _selectedLocation;

  // Called when user types in the search field.
  void _onSearchChanged(String keyword) async {
    keyword = keyword.trim();
    if (keyword.isNotEmpty) {
      // Query the API (replace with your actual implementation)
      final results = await LocationRepository().searchLocations(
        locationName: keyword,
      );
      setState(() {
        _searchResults = results;
      });
    } else {
      setState(() {
        _searchResults = [];
      });
    }
  }

  // Called when a user selects a location from the search results.
  void _onLocationSelected(Location location) {
    setState(() {
      _selectedLocation = location;
      _searchResults = [];
      _searchController.clear();
      _searchFocusNode.unfocus();
    });
  }

  // Saves the location using LocationManager and navigates back.
  void _saveLocation(Location location) async {
    await LocationManager.saveLocation(location);
    if (mounted) {
      StatefulNavigationShell.of(context).goBranch(0);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Location')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              onChanged: _onSearchChanged,
            ),
            const SizedBox(height: 16),
            _searchResults.isNotEmpty
                ? SearchResult(
                    searchResults: _searchResults,
                    onLocationSelected: _onLocationSelected,
                  )
                : _selectedLocation != null
                ? LocationDetail(
                    location: _selectedLocation!,
                    onSaveLocation: _saveLocation,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
