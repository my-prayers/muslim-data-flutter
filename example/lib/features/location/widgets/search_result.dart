import 'package:flutter/material.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

/// A widget that displays a list of search results for locations.
class SearchResult extends StatelessWidget {
  const SearchResult({
    required this.searchResults,
    this.onLocationSelected,
    super.key,
  });

  final List<Location> searchResults;
  final Function(Location)? onLocationSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          final location = searchResults[index];
          return ListTile(
            title: Text(location.name),
            subtitle: Text(location.countryName),
            onTap: () {
              if (onLocationSelected != null) {
                onLocationSelected!(location);
              }
            },
          );
        },
      ),
    );
  }
}
