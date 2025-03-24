import 'package:contact_diary_app/firebase_options.dart';
import 'package:contact_diary_app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}
