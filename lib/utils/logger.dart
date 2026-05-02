import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final _level = kDebugMode ? Level.all : Level.warning;

final _simplePrinter = SimplePrinter();
final _prettyPrinter = PrettyPrinter();
final _printer = kDebugMode ? _prettyPrinter : _simplePrinter;

final logger = Logger(
  level: _level, 
  printer: _printer
);