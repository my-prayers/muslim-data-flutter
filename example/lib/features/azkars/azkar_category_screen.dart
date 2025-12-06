import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

/// A screen that displays a grid of Azkar categories.
class AzkarCategoryScreen extends StatelessWidget {
  const AzkarCategoryScreen({super.key});

  /// Navigates to the Azkar chapter screen when a category is tapped.
  void _onCategoryTap(BuildContext context, AzkarCategory category) {
    context.pushNamed(
      'azkar-chapter',
      queryParameters: {'categoryId': category.id.toString()},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Azkar Categories')),
      body: FutureBuilder<List<AzkarCategory>>(
        future: AzkarRepository().getAzkarCategories(language: Language.en),
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
      ),
    );
  }
}
