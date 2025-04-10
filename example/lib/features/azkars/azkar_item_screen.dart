import 'package:flutter/material.dart';

// Make sure to import your repository and model files
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

class AzkarItemScreen extends StatelessWidget {
  const AzkarItemScreen({required this.chapterId, super.key});

  final int chapterId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Azkar Items')),
      body: FutureBuilder<List<AzkarItem>>(
        future: MuslimRepository().getAzkarItems(chapterId, Language.en),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No items found."));
          }

          final azkarItems = snapshot.data!;
          return ListView.builder(
            itemCount: azkarItems.length,
            itemBuilder: (context, index) {
              final item = azkarItems[index];
              return Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.secondaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.secondaryFixedDim,
                    width: 2,
                  ),
                ),
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.item,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        item.translation,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        item.reference,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
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
