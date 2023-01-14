import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class merci extends StatelessWidget {
const merci({ Key? key, required String title, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdee0ff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 30.0, end: 30.0),
            Pin(size: 371.0, end: 110.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 46.0, end: 45.0),
                  Pin(size: 64.0, start: 0.0),
                  child: Text(
                    'Merci pour votre \nréservation',
                    style: TextStyle(
                      fontFamily: 'Philosopher',
                      fontSize: 29,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 48.0, middle: 0.356),
                  child: Text(
                    'Veuillez nous contacter en cas d\'empêchement',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Align(
                  alignment: Alignment(-0.055, 0.5),
                  child: SizedBox(
                    width: 205.0,
                    height: 54.0,
                    child: Stack(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 4, end: 4),
                              Pin(size: 48, middle: 0.5161),
                              child: Stack(
                                children: <Widget>[
                                  SizedBox.expand(
                                    child: ElevatedButton(
                                      onPressed: (){},
                                      child: const Text("Retourner à l'acccueil"),
                                      style: ElevatedButton.styleFrom (
                                        textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w700,
                                        ),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                      ),
                                    ),
                                  )
                                      
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.7),
            child: SizedBox(
              width: 121.0,
              height: 86.0,
              child: SvgPicture.string(
                _svg_axul,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_axul =
    '<svg viewBox="127.2 182.4 120.6 86.1" ><path transform="translate(126.2, 181.43)" d="M 47.20389938354492 87.14286041259766 L 1 40.93896102905273 L 11.96363830566406 29.97532272338867 L 47.20389938354492 64.43247222900391 L 110.6363677978516 1 L 121.5999984741211 11.96363830566406 L 47.20389938354492 87.14286041259766 Z" fill="#26fb51" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
