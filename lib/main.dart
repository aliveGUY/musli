import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:musli/firebase_options.dart';
import 'package:musli/views/login_view.dart';
import 'package:musli/views/register_vew.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
    ),
    home: const HomePage(),
    routes: {
      '/login/': (context) => const LoginView(),
      '/register/': (context) => const RegisterView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        }
        // final user = FirebaseAuth.instance.currentUser;
        // print(user);

        // if (user?.emailVerified ?? false) {
        //   print('You are verified user');
        // } else {
        //   return const VerifyEmailView();
        // }

        return const LoginView();
      },
    );
  }
}
