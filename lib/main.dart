import 'package:chitgoja/features/presentation/pages/home_page.dart';
// import 'package:chitgoja/features/presentation/pages/login_page.dart';
import 'package:chitgoja/on_generate_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chitgoja App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: OnGenerateRoute.route,

      routes: {
        "/": (context) {
          return HomePage();
        }
      },
      initialRoute: '/',
      // home:
    );
  }
}
