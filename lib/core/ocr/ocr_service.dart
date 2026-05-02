import 'dart:io';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

abstract class TextRecognizerService {
  Future<String> recognizeText(File image);
}

class MLKitTextRecognizer implements TextRecognizerService {

  final _textRecognizer = TextRecognizer();
  
  @override
  Future<String> recognizeText(File image) async {
    final inputImage = InputImage.fromFile(image);

    final RecognizedText recognizedText = await _textRecognizer.processImage(
        inputImage,
      );

      return recognizedText.text;
  }
}