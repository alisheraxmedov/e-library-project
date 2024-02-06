import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/consts/colors.dart';
import 'package:mylibrary/screens/redirector.dart';
import 'package:mylibrary/widgets/basic_text.dart';
import 'package:pinput/pinput.dart';

final _codeKey = GlobalKey<FormState>();
String code = "";

class CodeCheck extends StatelessWidget {
  final String verificationId;
  const CodeCheck({
    super.key,
    required this.verificationId,
  });

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fons/fon1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: _width * 1.3,
            width: _width * 0.9,
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * .05),
                child: Form(
                  key: _codeKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
//=========================================LOGO==============================================
                      SizedBox(
                        width: _width * .72,
                        child: Image.asset("assets/logo/logo.png"),
                      ),
//=========================================PINPUT==============================================
                      Pinput(
                        length: 6,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        onChanged: (value) {
                          code = value;
                        },
                        defaultPinTheme: PinTheme(
                          height: _width * .2,
                          width: _width * .2,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ConstColor.black,
                              width: 1.0,
                            ),
                          ),
                          textStyle: const TextStyle(fontSize: 24.0),
                        ),
                      ),
//=========================================BUTTON==============================================
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: _width * 0.15,
                              decoration: BoxDecoration(
                                color: ConstColor.yellow,
                                borderRadius: BorderRadius.circular(
                                  _width * .07,
                                ),
                              ),
                              child: GestureDetector(
                                child: basicText(
                                  "Verify Code",
                                  _width * 0.07,
                                  weight: FontWeight.bold,
                                ),
                                onTap: () async {
                                  PhoneAuthCredential credential =
                                      PhoneAuthProvider.credential(
                                    verificationId: verificationId,
                                    smsCode: code,
                                  );
                                  FirebaseAuth.instance
                                      .signInWithCredential(credential);
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const PageRedirector();
                                      },
                                    ),
                                    (route) => false,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
