// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/consts/colors.dart';
import 'package:mylibrary/screens/redirector.dart';
import 'package:mylibrary/service/funcsions/audio.dart';
import 'package:mylibrary/service/provider/provider.dart';
import 'package:mylibrary/widgets/audio_and_picture.dart';
import 'package:mylibrary/widgets/basic_text.dart';
import 'package:mylibrary/widgets/check_box.dart';
import 'package:mylibrary/widgets/textformfield.dart';
import 'package:provider/provider.dart';

final key = GlobalKey<FormState>();
// double width = 350.0;
final avtorController = TextEditingController();
final speakerController = TextEditingController();
final nameController = TextEditingController();

class Add extends StatelessWidget {
  Add({super.key});

  @override
  Widget build(BuildContext context) {
    // width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ConstColor.primaryColor,
      appBar: AppBar(
        toolbarHeight: width! * 0.23,
        centerTitle: true,
        title: Container(
          width: width! * .8,
          height: width! * .1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width! * .05),
            color: ConstColor.blue,
            border: Border.all(width: 2.0, color: ConstColor.blue),
          ),
          child: Row(
            children: [
//================================== Container(1) Audio ==================================
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.watch<ProviderClass>().color1,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(width! * .05),
                          bottomLeft: Radius.circular(width! * .05)),
                    ),
                    child: Text(
                      'audio'.tr(),
                      style: TextStyle(
                        color: context.watch<ProviderClass>().color1 ==
                                ConstColor.lightBlue
                            ? context.watch<ProviderClass>().conatinerPrimary
                            : context.watch<ProviderClass>().conatinerBlue,
                      ),
                    ),
                  ),
                  onTap: () {
                    context.read<ProviderClass>().changeColor(1);
                  },
                ),
              ),
//================================== Container(2) Book ==================================
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.watch<ProviderClass>().color2,
                      border: const Border.symmetric(
                        vertical:
                            BorderSide(width: 2.0, color: ConstColor.blue),
                      ),
                    ),
                    child: Text(
                      'book'.tr(),
                      style: TextStyle(
                        color: context.watch<ProviderClass>().color2 ==
                                ConstColor.lightBlue
                            ? context.watch<ProviderClass>().conatinerPrimary
                            : context.watch<ProviderClass>().conatinerBlue,
                      ),
                    ),
                  ),
                  onTap: () {
                    context.read<ProviderClass>().changeColor(2);
                  },
                ),
              ),
//================================== Container(3) Article ==================================
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.watch<ProviderClass>().color3,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(width! * .05),
                          bottomRight: Radius.circular(width! * .05)),
                    ),
                    child: Text(
                      'article'.tr(),
                      style: TextStyle(
                        color: context.watch<ProviderClass>().color3 ==
                                ConstColor.lightBlue
                            ? context.watch<ProviderClass>().conatinerPrimary
                            : context.watch<ProviderClass>().conatinerBlue,
                      ),
                    ),
                  ),
                  onTap: () {
                    context.read<ProviderClass>().changeColor(3);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Scaffold(
//================================== Change Containers ==================================
        body: Builder(
          builder: (context) {
            return containerList[context.watch<ProviderClass>().containerIndex];
          },
        ),
      ),
    );
  }

//====================================
  List<Widget> containerList = [
    const AudioContainer(),
    const BookContainer(),
    const ArticlContainer(),
  ];
//====================================
}

class AudioContainer extends StatelessWidget {
  const AudioContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ConstColor.primaryColor,
        border: Border.all(
          color: ConstColor.blue,
          width: 0.0,
        ),
      ),
      child: Form(
        key: key,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width! * 0.1),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: width! * 0.07),
                basicText("title_name".tr(), width! * .04,
                    color: ConstColor.blue.withOpacity(0.5)),
                formField(controller: nameController, screenWidth: width!),
                SizedBox(height: width! * 0.05),
                basicText("avtor".tr(), width! * .04,
                    color: ConstColor.blue.withOpacity(0.5)),
                formField(controller: speakerController, screenWidth: width!),
                SizedBox(height: width! * 0.05),
                basicText("speaker".tr(), width! * .04,
                    color: ConstColor.blue.withOpacity(0.5)),
                formField(controller: avtorController, screenWidth: width!),
                SizedBox(height: width! * 0.05),
//================================== Audio(File) Select and Upload Button ==================================
                AudioAndPicture(
//flutter_spinkit || wave_linear_progress_indicator || percent_indicator
                  width: width!,
                ),
                SizedBox(height: width! * 0.05),
//================================== Audio(Info) Select and Upload Button ==================================
                Container(
                  padding: EdgeInsets.all(width! * 0.02),
                  decoration: BoxDecoration(
                    color: ConstColor.primaryColor,
                    border: Border.all(
                      width: 1,
                      color: ConstColor.blue,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const CheckBoxWidget(),
                            basicText(
                              "Private",
                              width! * 0.04,
                              color: ConstColor.blue,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ConstColor.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width! * 0),
                            ),
                          ),
                          onPressed: () async{
                            await uploadAudio();
                            uploadDataFirestoreDatabase({
                              "title: ": nameController.text,
                              "avtor: ": avtorController.text,
                              "speaker: ": speakerController.text,
                              "date: ": DateTime.now().toString(),
                              // ignore: use_build_context_synchronously
                              "private: ": Provider.of<ProviderClass>(
                                context,
                                listen: false,
                              ).checkValue,
                              "duration: ": "00:00",
                              "size: ": "${(fileSize/(1024 * 1024)).round()} MB",
                              "audioFile: ": downloadUrl.toString(),
                            }).then((value) {
                              nameController.clear();
                              avtorController.clear();
                              speakerController.clear();
                            });
                          },
                          child: Text(
                            "upload".tr(),
                            style: TextStyle(
                              color: ConstColor.primaryColor,
                              fontSize: width! * 0.045,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookContainer extends StatelessWidget {
  const BookContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ConstColor.primaryColor,
        border: Border.all(
          color: ConstColor.blue,
          width: 0.0,
        ),
      ),
      child: const Center(
        child: Text(
          "Container 2",
        ),
      ),
    );
  }
}

class ArticlContainer extends StatelessWidget {
  const ArticlContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ConstColor.primaryColor,
        border: Border.all(
          color: ConstColor.blue,
          width: 0.0,
        ),
      ),
      child: const Center(
        child: Text(
          "Container 3",
        ),
      ),
    );
  }
}
