import 'package:car_rental/presentation/main/main_screen.dart';
import 'package:car_rental/presentation/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'app/env/links.dart';
import 'app/env/routing.dart';
import 'core/constants/word_language.dart';
import 'core/models/address.dart';
import 'core/services/address_services.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Locale myLocale = Localizations.localeOf(context);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR')],
      translations: WordLanguage(),
      locale: const Locale('fr', 'FR'),
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: AppLinks.splash1Route,
      getPages: AppRouting.routes,
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return MainScreen();
    }
    return SignInScreen();
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                AddressServices addressServices = AddressServices();
                Address address = Address(
                    addressId: "",
                    description: "descriptiondescriptiondescription",
                    longitude: 40,
                    latitude: 30,
                    placeName: "placeNameplaceName");
                addressServices.addToFirebase(address.toMap());
              },
              child: const Text("Ajouter une marque de voiture"),
            ),
            Text("Voici la description de l'addresse $description"),
            ElevatedButton(
                onPressed: () async {
                  AddressServices addressServices = AddressServices();
                  // await addressServices.get(id: "o1jmjrv1hqo51H2qHQNY");
                  setState(() {
                    // Address address = Address.fromMap(data);
                    // description = address.description;
                  });
                },
                child: const Text("GET"))
          ],
        ),
      ),
    );
  }
}
