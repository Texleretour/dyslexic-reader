import 'package:dislexic/core/file_picker/file_picker_service.dart';
import 'package:dislexic/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final FilePickerService _galleryPicker = ImageFilePicker(ImageSource.gallery);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dislexic reader')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () => context.read<HomeProvider>()
                .pickAndProcessFile(_galleryPicker),
              icon: Icon(Icons.photo_library),
              label: Text('Pick an image'),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Consumer<HomeProvider>(
                builder: (context, homeProvider, child) {
                  return Text(homeProvider.recognizedText);
                },
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