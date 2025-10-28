import 'package:enos_portfolio/util/content_constants.dart';
import 'package:enos_portfolio/util/media_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../../util/custom_colors.dart';
import '../../../../util/image_asset_constants.dart';

class AboutDescription extends StatelessWidget {
  final bool isVertical;
  final double width;

  const AboutDescription(
      {required this.isVertical, required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
            const SizedBox(
              height: 48.0,
            ),
            Text(
              ContentConstants.aboutTitle,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 24.0),
            Text(
              ContentConstants.aboutDescription,
              style: theme.textTheme.bodySmall,
            ),
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
              onTap: () async => !await launchUrl(Uri.parse(
                  'https://mail.google.com/mail/u/0/?fs=1&to=${MediaConstants.email}&tf=cm')),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "View Resume",
                      style: theme.textTheme.labelLarge,
                    ),
                    const SizedBox(width: 8.0),
                    SvgPicture.asset(ImageAssetConstants.arrow,
                        colorFilter: ColorFilter.mode(
                            theme.colorScheme.onPrimary, BlendMode.srcIn),
                        width: 18,
                        height: 18),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 96.0,
            ),
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
                      textAlign:
                          isVertical ? TextAlign.center : TextAlign.start,
                      textStyle: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray, fontSize: 15)),
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
