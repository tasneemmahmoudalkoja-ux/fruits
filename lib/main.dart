import 'package:ecommercefrutes/app/my_app.dart';
import 'package:ecommercefrutes/core/services/custom_observer_bloc_log.dart';
import 'package:ecommercefrutes/core/services/get_it_service.dart';
import 'package:ecommercefrutes/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer=CustomObserverBlocLog();
  setup();
  runApp(const MyApp());
}
