import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv package
import 'package:learningwithpulsezest/Form/form.dart';
import 'package:learningwithpulsezest/Read/ReadbyDoc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");  // Load the .env file

  try {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: dotenv.env['API_KEY'] ?? '',
        authDomain: dotenv.env['AUTH_DOMAIN'] ?? '',
        projectId: dotenv.env['PROJECT_ID'] ?? '',
        storageBucket: dotenv.env['STORAGE_BUCKET'] ?? '',
        messagingSenderId: dotenv.env['MESSAGING_SENDER_ID'] ?? '',
        appId: dotenv.env['APP_ID'] ?? '',
        measurementId: dotenv.env['MEASUREMENT_ID'] ?? '',
      ),
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => UserRegistration()));
              },
              child: Text("Create"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ReadByDoc()));
              },
              child: Text("Read"),
            )
          ],
        ),
      ),
    );
  }
}
