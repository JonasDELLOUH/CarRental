import 'package:car_rental/constants/word_language.dart';
import 'package:car_rental/models/address.dart';
import 'package:car_rental/providers/auth_provider.dart';
import 'package:car_rental/screens/home.dart';
import 'package:car_rental/screens/sign_in.dart';
import 'package:car_rental/screens/test.dart';
import 'package:car_rental/services/address_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'constants/colors.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Locale myLocale = Localizations.localeOf(context);
  runApp(GetMaterialApp(
    home: const MyApp(),
    translations: WordLanguage(),
    locale: const Locale('fr', 'FR'),
    // locale: Localizations.localeOf(context),
    fallbackLocale: const Locale('en', 'US'),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: ConstColors.backgroundColor,
          ),
          home: const Home(),
        ));
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const Home();
    }
    return const SignIn();
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
              child: Text("Ajouter une marque de voiture"),
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
                child: Text("GET"))
          ],
        ),
      ),
    );
  }
}
