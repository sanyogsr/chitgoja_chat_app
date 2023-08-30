// import 'package:chitgoja/features/presentation/pages/home_page.dart';
import 'package:chitgoja/features/presentation/cubits/auth/cubit/auth_cubit.dart';
import 'package:chitgoja/features/presentation/cubits/credentials/cubit/credential_cubit.dart';
import 'package:chitgoja/features/presentation/pages/login_page.dart';
// import 'package:chitgoja/features/presentation/pages/login_page.dart';
import 'package:chitgoja/on_generate_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chitgoja/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
      BlocProvider<AuthCubit>(create: (_)=> di.sl<AuthCubit>()..appStarted())
      ,BlocProvider<CredentialCubit>(create: (_)=> di.sl<CredentialCubit>())
     ],
      child: MaterialApp(
        title: 'Chitgoja App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        onGenerateRoute: OnGenerateRoute.route,

        routes: {
          "/": (context) {
            return LoginPage();
          }
        },
        initialRoute: '/',
        // home:
      ),
    );
  }
}
