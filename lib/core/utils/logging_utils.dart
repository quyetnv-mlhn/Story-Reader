import 'package:logger/logger.dart';

var logger = Logger(
  filter: DevelopmentFilter(),
  level: Level.all,
  output: ConsoleOutput(),
  printer: PrettyPrinter(methodCount: 10),
);
