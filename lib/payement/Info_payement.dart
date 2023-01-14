import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './page_remerciement.dart';

class info_payement extends StatefulWidget {
  const info_payement({Key? key, required String title}) : super(key: key);

  @override
  State<info_payement> createState() => _info_payementState();
}

class _info_payementState extends State<info_payement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(),
              Form(
                child: Column(
                  children: [
                   Align(
                     child: Text('INFO PAYEMENT', style: TextStyle(
                       fontFamily: 'Philosopher',
                       fontSize: 25,
                       color: const Color(0xff000000),
                       fontWeight: FontWeight.w700,
                     ),
                       textAlign: TextAlign.center,
                     ),
                   ),
                    TextFormField(

                     //controller: cardNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(19),
                        CardNumberInputFormatter(),
                      ],

                      decoration: InputDecoration(
                          icon: Icon(Icons.credit_card),
                          hintText: "Numéro de carte"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: TextFormField(
                        decoration:
                        const InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: "Nom complet"),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                           FilteringTextInputFormatter.digitsOnly,
                              // Limit the input
                            LengthLimitingTextInputFormatter(4),
                            ],
                            decoration: const InputDecoration(
                                hintText: "CVV"),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                             FilteringTextInputFormatter.digitsOnly,
                             LengthLimitingTextInputFormatter(5),
                              CardMonthInputFormatter(),
                            ],
                            decoration:
                            const InputDecoration(hintText: "MM/AA"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  child: const Text("Payer"),
                  style: ElevatedButton.styleFrom (
                    backgroundColor: const Color(0xff2195f2),
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                    minimumSize: Size(180.0, 45.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  ),
                  onPressed: () { Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const merci(title: "connexion") )
                  );},

                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
