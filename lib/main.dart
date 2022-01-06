import 'package:flutter/material.dart';

import 'injection.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const MyApp());
}
