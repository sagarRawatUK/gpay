import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpay/pages/payment/view/otp_screen.dart';
import 'package:gpay/utils/color_constants.dart';
import 'package:gpay/utils/constants.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  final TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    setInitialValue();
    super.initState();
  }

  void setInitialValue() {
    setState(() {
      amountController.text = '0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    imageUrl: AppConstants.profileUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.white,
              ),
              const SizedBox(
                width: 7,
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    imageUrl: AppConstants.companyLogo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Payment to NETFLIX',
            style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            '(netflix@axis)',
            style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '₹',
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IntrinsicWidth(
                child: TextFormField(
                    controller: amountController,
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                      ),
                    ),
                    maxLength: 5,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      counter: SizedBox.shrink(),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    )),
              ),
            ],
          ),
          Text(
            'Payment via Billdesk',
            style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          FadedSlideAnimation(
            beginOffset: const Offset(0, 1),
            endOffset: const Offset(0, 0),
            slideDuration: AppConstants.animationDuration,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.credit_card,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Your Bank **** 4321',
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_down,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OtpScreen()),
                      );
                    },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorConstants.scaffoldBgColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Proceed to pay',
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'IN PARTNERSHIP WITH YOUR BANK',
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
