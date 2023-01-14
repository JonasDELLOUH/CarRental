import 'package:flutter/material.dart';
import './mon_compte.dart';
import './Paramètre.dart';


class profil extends StatefulWidget {
  const profil({super.key, required this.title});

  final String title;

  @override
  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Profil",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            color: const Color(0xff656d74),
            fontWeight: FontWeight.w700,),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 115, width: 115,
          child: Stack(
            fit: StackFit.expand,
           // overflow : Overflow.visible,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/profil.png"),
                backgroundColor: Color(0xfffafffb),
              ),
              Positioned(
                right: -1,
                  bottom: 0,
                  child: SizedBox(
                height: 46, width: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff646c74),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                  ),
                  onPressed: () {},
                  child: Icon(Icons.add_a_photo), //Image(image: AssetImage('assets/images/photo.png'),),
                ),
              )),
            ],
          ),
          ),
          SizedBox(height: 20,),
          //Premier boutton
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
                onPressed: (){ Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const mon_compte(title : "info compte") )
                ); },
                child: Row(
                  children: [
                    Icon(Icons.person, size: 20, color: Colors.black,),
                   SizedBox(width: 30,),
                    Expanded(child: Text("Mon compte",
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
          //deuxième boutton
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
                onPressed: (){},
                child: Row(
                  children: [
                    Icon(Icons.notifications, size: 20, color: Colors.black,),
                    SizedBox(width: 30,),
                    Expanded(child: Text("Notification",
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
          //troisième boutton
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
                onPressed: (){ Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const parametre(title : "parametre") )
                );},
                child: Row(
                  children: [
                    Icon(Icons.settings, size: 20, color: Colors.black,),
                    SizedBox(width: 30,),
                    Expanded(child: Text("Paramètre",
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
          //quatrième boutton
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
                onPressed: (){},
                child: Row(
                  children: [
                    Icon(Icons.help, size: 20, color: Colors.black,),
                    SizedBox(width: 30,),
                    Expanded(child: Text("Centre d'aide",
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
          //cinquième boutton
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
                onPressed: (){},
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 20, color: Colors.black,),
                    SizedBox(width: 30,),
                    Expanded(child: Text("Se déconnecté",
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
