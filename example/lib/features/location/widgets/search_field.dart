import 'package:flutter/material.dart';

/// A widget that displays a search field for entering a location.
class SearchField extends StatelessWidget {
  const SearchField({
    this.controller,
    this.focusNode,
    this.onChanged,
    super.key,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: const InputDecoration(
        hintText: 'Search location...',
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
