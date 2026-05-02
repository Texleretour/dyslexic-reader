import 'dart:io';

import 'package:dislexic/core/file_picker/file_picker_service.dart';
import 'package:dislexic/utils/exceptions.dart';
import 'package:dislexic/utils/logger.dart';
import 'package:flutter/widgets.dart';

class HomeProvider extends ChangeNotifier {

  bool _processing = false;
  bool get processing => _processing;

  String _error = '';
  String get error => _error;

  String _recognizedText = '';
  String get recognizedText => _recognizedText;

  void setProcessing(bool value) {
    _processing = value;
    notifyListeners();
  }

  void setError(String text) {
    _error = text;
    notifyListeners();
  }

  void setRecognizedText(String text) {
    _recognizedText = text;
    notifyListeners();
  }

  Future<void> pickAndProcessFile(FilePickerService filePicker) async {
    setError('');
    setProcessing(true);

    try {
      final File? pickedFile = await filePicker.pickFile();
      setProcessing(false);
      logger.d('[Home Provider] picked file: $pickedFile');
      if (pickedFile == null) {
        return;
      }
      // TODO: OCR
    } on PermissionsNotGrantedException {
      setError('pas la perm!');
    } catch (e) {
      setError('Ouais non ca craint');
    }
  }
}