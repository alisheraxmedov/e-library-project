import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/consts/colors.dart';
import 'package:mylibrary/screens/authentication/check_code.dart';
import 'package:mylibrary/screens/authentication/login.dart';
import 'package:mylibrary/service/provider/provider.dart';
import 'package:mylibrary/widgets/basic_text.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();

final usernameController = TextEditingController();
final passwordController = TextEditingController();
final phoneController = TextEditingController(text: "+998");

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
//=============================== FUNCSION ===============================
    // ignore: unused_element
    Future getCode() async {
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseException exception) {},
        codeSent: (String verificationId, int? forceResendingToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CodeCheck(verificationId: verificationId);
              },
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: phoneController.text.toString(),
      );
    }

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
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * .72,
            child: AspectRatio(
              aspectRatio: 4 / 7,
              child: SizedBox(
                // ================================= SizedBox qilib o'zgartirilsin!=====================
                // decoration: BoxDecoration(
                //   color: ConstColor.lightBlue,
                //   borderRadius: BorderRadius.circular(
                //       MediaQuery.sizeOf(context).width * 0.15),
                // ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * .05),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
//=========================================LOGO==============================================
                        Image.asset("assets/logo/logo.png"),
//=========================================USERNAME==============================================
                        TextFormField(
                          controller: usernameController,
                          style: TextStyle(
                            color: ConstColor.white,
                            fontSize: _width * 0.04,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            label: basicText(
                              "Name or Username",
                              _width * .04,
                              color: ConstColor.white.withOpacity(0.5),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(_width * 0.07),
                              gapPadding: 12,
                              borderSide:
                                  const BorderSide(color: ConstColor.white),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please, fill in the field";
                            }
                            return null;
                          },
                        ),
//========================================= PASSWORD ==============================================
                        TextFormField(
                          controller: passwordController,
                          obscureText: context.watch<ProviderClass>().isVisible,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            color: ConstColor.white,
                            fontSize: _width * 0.04,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                context.read<ProviderClass>().changeVisible();
                              },
                              icon: context.watch<ProviderClass>().isVisible
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            // Icon(Icons.visibility),
                            label: basicText(
                              "Password",
                              _width * .04,
                              color: ConstColor.white.withOpacity(0.5),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(_width * 0.07),
                              gapPadding: 12,
                              borderSide:
                                  const BorderSide(color: ConstColor.white),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please, fill in the field";
                            }
                            return null;
                          },
                        ),
//========================================= PHONE NUMBER ==============================================
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            color: ConstColor.white,
                            fontSize: _width * 0.04,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.phone),
                            // Icon(Icons.visibility),
                            label: basicText(
                              "Phone Number",
                              _width * .04,
                              color: ConstColor.white.withOpacity(0.5),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(_width * 0.07),
                              gapPadding: 12,
                              borderSide:
                                  const BorderSide(color: ConstColor.white),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please, fill in the field";
                            }
                            return null;
                          },
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
                                    "Sign Up",
                                    _width * 0.07,
                                    weight: FontWeight.bold,
                                  ),
                                  onTap: () {
                                    getCode();
                                    print(
                                        " ========================== ${phoneController.text}");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
//====================================== CHANGE SIGN IN =================================================
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "I already have an account",
                                  style: TextStyle(
                                    color: ConstColor.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(
                                      color: ConstColor.lightBlue,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Login(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                ),
                              ],
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
      ),
    );
  }
}
