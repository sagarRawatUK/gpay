import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpay/pages/payment/view/payment_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PaymentPage()),
            );
          },
          child: Text(
            'Pay with GPay',
            style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                fontSize: 22,
                color: Colors.green,
              ),
            ),
          ),
        )),
      ),
    );
  }
}
