import 'package:flutter/material.dart';
import './Info_payement.dart';


enum SingingCharacter { CB, PP, KP }

class choix_moyen_payement extends StatefulWidget {
  const choix_moyen_payement({super.key, required this.title});

  final String title;

  @override
  State<choix_moyen_payement> createState() => _choix_moyen_payementState();
}

class _choix_moyen_payementState extends State<choix_moyen_payement> {
  SingingCharacter? _character = SingingCharacter.CB;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color(0xffb4b7b7),
      appBar: AppBar(
        backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        leading: Icon(Icons.arrow_back),
      ),
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment(-0.077, -0.8),
            child: SizedBox(
              width: 300,
             // height: 500,
              child: Image.asset("assets/images/voiture.png"),
            ),
          ),
          SizedBox(height: 70,),
          ListTile(
            title: const Text('Crédit/Carte débit'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.CB,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),

          ),
          ListTile(
            title: const Text('Pay Pal'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.PP,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Kikka Pay'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.KP,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
         ElevatedButton(
             onPressed: () {
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => const info_payement(title: "connexion") )
               );

         },
             child: Text("Passer au payement"),
           style: ElevatedButton.styleFrom (
             backgroundColor: const Color(0xff2195f2),
             textStyle: const TextStyle(
               color: Colors.black,
               fontFamily: 'Montserrat',
               fontWeight: FontWeight.w700,
             ),
             minimumSize: Size(180.0, 45.0),
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
           ),

         ),



        ],
        
      ),
    );
  }
}
