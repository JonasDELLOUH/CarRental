import 'package:flutter/material.dart';

class mon_compte extends StatefulWidget {
  const mon_compte({Key? key, required String title}) : super(key: key);

  @override
  State<mon_compte> createState() => _mon_compteState();
}

class _mon_compteState extends State<mon_compte> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Modifier information",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            color: const Color(0xff656d74),
            fontWeight: FontWeight.w700,),
        ),

        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Entrez votre nom et prénom',
                labelText: 'Nom & Prénom *'),
            validator: (String? value) {
              return (value == null || value == "")
                  ? "Ce champ est obligatoire"
                  : null;
            },
          ),
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'Entrez votre email',
                labelText: 'Email*'),
            validator: (String? value) {
              return (value == null || value == "")
                  ? "Ce champ est obligatoire"
                  : null;
            },
          ),
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Entrez votre numéro de téléphone',
                labelText: 'Numéro*'),
            validator: (String? value) {
              return (value == null || value == "")
                  ? "Ce champ est obligatoire"
                  : null;
            },
          ),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){}, child: Text("Valider"),
            style: ElevatedButton.styleFrom (
              backgroundColor: const Color(0xff62d249),
              textStyle: const TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
              minimumSize: Size(232.0, 45.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          )

        ],
      ),
    );
  }
}
