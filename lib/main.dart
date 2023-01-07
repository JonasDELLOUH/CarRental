import 'package:car_rental/constants/word_language.dart';
import 'package:car_rental/models/address.dart';
import 'package:car_rental/models/car_brand.dart';
import 'package:car_rental/providers/auth_provider.dart';
import 'package:car_rental/screens/car_details.dart';
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
import 'models/car.dart';

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
            appBarTheme:  const AppBarTheme(
              backgroundColor: ConstColors.backgroundColor,
            ),
          ),
          home: CarDetails(
            car: Car(
                carId: "mkQ044PKvlQkysHc2fH7",
                carBrand: CarBrand(
                    carBrandId: "VOvGIDu0uR68F6BPDliZ",
                    carBrandImageUrl:
                        "https://firebasestorage.googleapis.com/v0/b/carrental-89ac9.appspot.com/o/carBrand%2FVOvGIDu0uR68F6BPDliZ?alt=media&token=890c6e69-61a5-47e3-8cc1-a66b12bee6f7",
                    carBrandName: "Ferrary"),
                nbrPlaces: 5,
                nbrStars: 4,
                rentalPrice: 2500,
                carSpeed: 600,
                carImageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/carrental-89ac9.appspot.com/o/car%2FmkQ044PKvlQkysHc2fH7?alt=media&token=0b4e0b03-7183-4fb4-8dec-cf592548e684",
                carModel: "RTRS",
                addedDate: 602,
                isReserved: false,
                isRented: false,
                overview:
                    "Voiture class, très accessible à conduire et super cool."),
          ),
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
