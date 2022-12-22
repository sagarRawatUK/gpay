import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpay/pages/payment/controller/payment_controller.dart';
import 'package:gpay/pages/payment/view/payment_done.dart';
import 'package:gpay/utils/asset_constants.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final paymentController = Get.put(PaymentController());
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ICICI Bank',
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Image.asset(
                    AssetConstants.upiImage,
                    height: 40,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.indigo.shade900,
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Text(
                    'Verve Financial Services',
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '₹ 1.00',
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'ENTER UPI PIN',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700),
                    ),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Obx(
                    () => Icon(
                      paymentController.isPinVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        paymentController.isPinVisible.value =
                            !paymentController.isPinVisible.value;
                      },
                      child: Text(
                        paymentController.isPinVisible.value ? 'HIDE' : 'SHOW',
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => Pinput(
                length: 4,
                obscureText: !paymentController.isPinVisible.value,
                pinAnimationType: PinAnimationType.scale,
                controller: pinController,
                defaultPinTheme: defaultPinTheme,
                pinContentAlignment: Alignment.bottomCenter,
                showCursor: true,
                isCursorAnimationEnabled: false,
                useNativeKeyboard: false,
                cursor: Container(
                  width: 56,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              color: Colors.grey.shade200,
              child: NumericKeyboard(
                  textColor: Colors.indigo,
                  onKeyboardTap: (value) {
                    pinController.append(value, 4);
                  },
                  rightButtonFn: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentDone()),
                    );
                  },
                  rightIcon: const Icon(
                    Icons.check_circle,
                    color: Colors.indigo,
                    size: 60,
                  ),
                  leftButtonFn: () {
                    if (pinController.text.isNotEmpty) {
                      pinController.text = pinController.text
                          .substring(0, pinController.text.length - 1);
                    }
                  },
                  leftIcon: const Icon(
                    Icons.backspace,
                    color: Colors.indigo,
                    size: 35,
                  ),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly),
            )
          ],
        ),
      ),
    );
  }
}

final defaultPinTheme = PinTheme(
  width: 56,
  height: 80,
  textStyle: GoogleFonts.openSans(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  ),
);
