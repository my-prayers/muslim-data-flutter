import 'package:flutter/material.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

class NamesScreen extends StatelessWidget {
  const NamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('99 Names of Allah')),
      body: FutureBuilder<List<NameOfAllah>>(
        future: MuslimRepository().getNames(Language.en),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No data found'));
          }
          final names = snapshot.data!;
          return ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              final currentName = names[index];
              return ListTile(
                title: Text(currentName.name),
                subtitle: Text(currentName.translation),
              );
            },
          );
        },
      ),
    );
  }
}
