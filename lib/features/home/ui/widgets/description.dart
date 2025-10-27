import 'package:enos_portfolio/util/media_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../../util/custom_colors.dart';

class Description extends StatelessWidget {
  final bool isVertical;
  final double width;
  const Description(
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
             const Text("Hello, I am",
                    style: TextStyle(
                        color: Colors.white, fontSize: 16)),
            const SizedBox(height: 2.0),
            const Text('Enos Okello',
                style: TextStyle(
                    color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4.0),
            const Text('I turn complex ideas into scalable, high-performing software solutions.',
                style: TextStyle(
                    color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            const Text("I'm a result-driven Software Engineer with 7+ years of"
                " experience in Saas, Mobile Apps, and Cloud Infrastructure. I design,"
                " architect and deploy systems that are not only technically robust,"
                " but also deliver real business impact.",
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
                child: const Text("Get In Touch",
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
