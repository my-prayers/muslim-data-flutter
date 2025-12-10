import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

/// A screen that displays a grid of Azkar categories.
class AzkarCategoryScreen extends StatefulWidget {
  const AzkarCategoryScreen({super.key});

  @override
  State<AzkarCategoryScreen> createState() => _AzkarCategoryScreenState();
}

class _AzkarCategoryScreenState extends State<AzkarCategoryScreen> {
  final _searchController = TextEditingController();
  final _repository = AzkarRepository();
  bool _isSearching = false;
  List<AzkarChapter> _searchResults = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Navigates to the Azkar chapter screen when a category is tapped.
  void _onCategoryTap(BuildContext context, AzkarCategory category) {
    context.pushNamed(
      'azkar-chapter',
      queryParameters: {'categoryId': category.id.toString()},
    );
  }

  /// Navigates to the Azkar item screen when a search result is tapped.
  void _onSearchResultTap(BuildContext context, AzkarChapter chapter) {
    context.pushNamed(
      'azkar-item',
      queryParameters: {'chapterId': chapter.id.toString()},
    );
  }

  /// Performs search for azkar chapters.
  Future<void> _performSearch(String query) async {
    if (query.isEmpty) {
      setState(() {
        _isSearching = false;
        _searchResults = [];
      });
      return;
    }

    setState(() {
      _isSearching = true;
    });

    final results = await _repository.searchAzkarChapters(
      language: const Locale('en'),
      query: query,
    );

    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Azkar Categories')),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search azkar chapters...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _performSearch('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: _performSearch,
            ),
          ),
          // Content area
          Expanded(
            child: _isSearching
                ? _buildSearchResults()
                : _buildCategoriesGrid(),
          ),
        ],
      ),
    );
  }

  /// Builds the search results list.
  Widget _buildSearchResults() {
    if (_searchResults.isEmpty) {
      return const Center(child: Text('No results found'));
    }

    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final chapter = _searchResults[index];
        return Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Theme.of(context).colorScheme.secondaryFixedDim,
              width: 2,
            ),
          ),
          child: ListTile(
            title: Text(chapter.name),
            subtitle: Text(chapter.categoryName),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _onSearchResultTap(context, chapter),
          ),
        );
      },
    );
  }

  /// Builds the categories grid.
  Widget _buildCategoriesGrid() {
    return FutureBuilder<List<AzkarCategory>>(
      future: _repository.getAzkarCategories(language: const Locale('en')),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No categories found'));
        }

        final categories = snapshot.data!;
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          padding: const EdgeInsets.all(10),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return InkWell(
              onTap: () => _onCategoryTap(context, category),
              child: Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.secondaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.secondaryFixedDim,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
