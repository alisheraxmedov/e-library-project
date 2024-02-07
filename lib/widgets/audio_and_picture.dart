import 'package:flutter/material.dart';
import 'package:mylibrary/consts/colors.dart';
import 'package:mylibrary/service/funcsions/audio.dart';
import 'package:mylibrary/widgets/basic_text.dart';

class AudioAndPicture extends StatelessWidget {
  final double width;
  const AudioAndPicture({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
//=========================== Image selected ===========================
    return Container(
      height: width * 0.2,
      decoration: const BoxDecoration(color: ConstColor.black),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/audio.png"),
                  ),
                ),
              ),
              onTap: () {
                print("Bu rasm belgilash uchun tugma!");
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: ConstColor.primaryColor,
                child: basicText("Select Audio file", width * 0.05, color: ConstColor.blue),
              ),
              onTap: () async {
//==================================== Upload Storage ====================================
                selectAudioFile();
//==================================== Upload Realtime Database ====================================
              },
            ),
          ),
        ],
      ),
    );
  }
}
