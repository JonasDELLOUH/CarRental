import 'package:flutter/material.dart';

class parametre extends StatefulWidget {
  const parametre({Key? key, required String title}) : super(key: key);

  @override
  State<parametre> createState() => _parametreState();
}

class _parametreState extends State<parametre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Paramètre",
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
          //language
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:  ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xfffafffb),
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                ),
                onPressed: (){ },
                child: Row(
                  children: [
                    Icon(Icons.language, size: 20, color: Colors.black,),
                    SizedBox(width: 30,),
                    Expanded(child: Text("Language",
                      style: TextStyle(
                        color: Colors.black,
                        //fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.black,),
                  ],
                )
            ),
          ),
          SizedBox(height: 30,),
          //historique des vehicule réserver
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:  ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xfffafffb),
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                ),
                onPressed: (){ },
                child: Row(
                  children: [
                    Icon(Icons.history, size: 20, color: Colors.black,),
                    SizedBox(width: 30,),
                    Expanded(child: Text("Historique des véhicule réserver",
                      style: TextStyle(
                        color: Colors.black,
                        //fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.black,),
                  ],
                )
            ),
          ),
          //Enregistrer moyen de payement
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:  ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xfffafffb),
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                ),
                onPressed: (){ },
                child: Row(
                  children: [
                    Icon(Icons.credit_card, size: 20, color: Colors.black,),
                    SizedBox(width: 30,),
                    Expanded(child: Text("Enregistrer un moyen de payement",
                      style: TextStyle(
                        color: Colors.black,
                        //fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.black,),
                  ],
                )
            ),
          ),
        ],
      ),

    );
  }
}
