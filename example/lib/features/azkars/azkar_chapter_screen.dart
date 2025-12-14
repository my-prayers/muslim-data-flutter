import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart'; // Adjust the import path as needed.

class AzkarChapterScreen extends StatelessWidget {
  const AzkarChapterScreen({required this.categoryId, super.key});

  final int categoryId;

  /// Navigates to the Azkar item screen when a chapter is tapped.
  void _onChapterTap(BuildContext context, AzkarChapter chapter) {
    context.pushNamed(
      'azkar-item',
      queryParameters: {'chapterId': chapter.id.toString()},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Azkar Chapters')),
      body: FutureBuilder<List<AzkarChapter>>(
        future: HisnulMuslimRepository().getAzkarChapters(
          language: const Locale('en'),
          categoryId: categoryId,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No chapters found."));
          }

          final chapters = snapshot.data!;
          return ListView.builder(
            itemCount: chapters.length,
            itemBuilder: (context, index) {
              final chapter = chapters[index];
              return ListTile(
                title: Text(chapter.name),
                onTap: () {
                  _onChapterTap(context, chapter);
                },
              );
            },
          );
        },
      ),
    );
  }
}
