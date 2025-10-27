import 'package:enos_portfolio/util/media_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../../util/custom_colors.dart';

class AboutDescription extends StatelessWidget {
  final bool isVertical;
  final double width;
  const AboutDescription(
      {required this.isVertical, required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.orange,
      child: SizedBox(
        // width: isVertical ? double.infinity : width * 0.29,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment:
          //     isVertical ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 48.0,),
             const Text("Get to know me...",
                    style: TextStyle(
                        color: Colors.white, fontSize: 16)),
            const SizedBox(height: 8.0),
            const Text("Versatile Software Engineer with over 5 years of experience designing and building scalable,"
                " high-performance applications across mobile, web, and backend platforms. Skilled in Flutter,"
                " React Native, Swift, Java, Kotlin, and Python (Django), with a strong background in developing"
                " cross-platform solutions that enhance user experience and operational efficiency.\n\n"
                "Experienced in automation solutions using Google MLKit (OCR, Face, and Text Recognition) and"
                " in building document-processing workflows for PDF, Excel, and ID verification.\n\n"
                "Known for writing clean, maintainable code, solving complex problems, and continuously learning"
                " to deliver high-quality, cross-platform solutions. Passionate about innovation, performance optimization,"
                " and translating complex business processes into intelligent, user-centric digital products.",
                style: TextStyle(
                    color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 48.0),
            // SizedBox(
            //   width: isVertical ? double.infinity : width * 0.29,
            //   height: 90,
            //   child: AnimatedTextKit(
            //     repeatForever: true,
            //     pause: const Duration(seconds: 2),
            //     animatedTexts: [
            //       TyperAnimatedText(
            //           "I'm developing mobile,frontend and backend applications",
            //           textAlign: isVertical ? TextAlign.center : TextAlign.start,
            //           textStyle: GoogleFonts.getFont('Delius',
            //               color: CustomColors.gray,
            //               fontSize: 15)),
            //     ],
            //   ),
            // ),
            InkWell(
              onTap: () async => !await launch(
                  'https://mail.google.com/mail/u/0/?fs=1&to=${MediaConstants.email}&tf=cm'),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: const Text("Download Resume",
                    style: TextStyle(
                        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
    return Container(
      color: Colors.orange,
      child: SizedBox(
        width: isVertical ? double.infinity : width * 0.29,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              isVertical ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 250,
                height: 40,
                alignment: Alignment.center,
                color: CustomColors.primary,
                child: Center(
                    child: Text('Mobile Application Developer',
                        style: GoogleFonts.getFont('Days One',
                            color: Colors.black, fontSize: 14)))),
            SizedBox(height: 0.015 * width),
            Text('Talk is cheap.',
                style: GoogleFonts.getFont('Delius',
                    color: Colors.white, fontSize: 30)),
            const SizedBox(height: 5),
            Text('Show me the code.',
                style: GoogleFonts.getFont('Delius',
                    color: Colors.white, fontSize: 30)),
            const SizedBox(height: 20),
            SizedBox(
              width: isVertical ? double.infinity : width * 0.29,
              height: 90,
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(seconds: 2),
                animatedTexts: [
                  TyperAnimatedText(
                      "I'm developing mobile,frontend and backend applications",
                      textAlign: isVertical ? TextAlign.center : TextAlign.start,
                      textStyle: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 15)),
                ],
              ),
            ),
            InkWell(
              onTap: () async => !await launch(
                  'https://mail.google.com/mail/u/0/?fs=1&to=${MediaConstants.email}&tf=cm'),
              child: Text("Let's chat",
                  style: GoogleFonts.getFont('Delius',
                      decoration: TextDecoration.underline,
                      color: CustomColors.primary,
                      fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}
