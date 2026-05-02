import 'dart:io';
import 'package:dislexic/utils/exceptions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class FilePickerService {
  Future<File?> pickFile();
}

class ImageFilePicker implements FilePickerService {
  final ImageSource _imageSource;
  final ImagePicker _imagePicker = ImagePicker();

  ImageFilePicker(this._imageSource);

  Future<bool> _requestPermissions() async {
    if (Platform.isIOS) {
      return false;
    }

    return true;
  }

  @override
  Future<File?> pickFile() async {
    final bool permissionsGranted = await _requestPermissions();
    if (!permissionsGranted) {
      throw PermissionsNotGrantedException('[ImageFile Picker] Permissions not granted');
    }

    final XFile? pickedFile = await _imagePicker.pickImage(source: _imageSource);

    if (pickedFile == null) {
      return null;
    }

    return File(pickedFile.path);
  }
}