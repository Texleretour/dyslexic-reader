import 'package:dislexic/core/file_picker/file_picker_service.dart';
import 'package:dislexic/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final FilePickerService _galleryPicker = ImageFilePicker(ImageSource.gallery);
  final FilePickerService _cameraPicker = ImageFilePicker(ImageSource.camera);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dyslexic reader')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Select a file to read:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => context
                      .read<HomeProvider>()
                      .pickAndProcessFile(_galleryPicker),
                  icon: Icon(Icons.photo_library),
                  label: const Text('Gallery'),
                ),
                ElevatedButton.icon(
                  onPressed: () => context
                      .read<HomeProvider>()
                      .pickAndProcessFile(_cameraPicker),
                  icon: Icon(Icons.camera),
                  label: const Text('Camera'),
                ),
              ],
            ),
            Divider(),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Consumer<HomeProvider>(
                  builder: (context, homeProvider, child) {
                    if (homeProvider.processing) {
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else {
                      return homeProvider.recognizedText.isEmpty
                          ? const Text('No text recognized.')
                          : Text(homeProvider.recognizedText);
                    }
                  },
                ),
              ),
            ),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return Text(homeProvider.error);
              },
            ),
          ],
        ),
      ),
    );
  }
}
