import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpay/pages/payment/view/payment_page.dart';
import 'package:gpay/utils/color_constants.dart';
import 'package:gpay/utils/constants.dart';

class PaymentDone extends StatefulWidget {
  const PaymentDone({super.key});

  @override
  State<PaymentDone> createState() => _PaymentDoneState();
}

class _PaymentDoneState extends State<PaymentDone> {
  bool showLoading = true;

  @override
  void initState() {
    showLoader();
    super.initState();
  }

  void showLoader() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBgColor,
      body: showLoading
          ? SpinKitThreeBounce(
              size: 20,
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                );
              },
            )
          : SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FadedScaleAnimation(
                    scaleDuration: AppConstants.animationDuration,
                    child: const FaIcon(
                      FontAwesomeIcons.solidCircleCheck,
                      color: Colors.white,
                      size: 110,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    '₹ 350 paid',
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Netflix',
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'mpl3287835@upi',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade300.withOpacity(0.8),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentPage()),
                          (route) => false);
                    },
                    child: FadedScaleAnimation(
                      scaleDuration: AppConstants.animationDuration,
                      child: Container(
                        height: 45,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ColorConstants.darkBlueColor.withOpacity(0.8),
                        ),
                        child: Text(
                          'Done',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
