import 'package:enos_portfolio/util/content_constants.dart';
import 'package:enos_portfolio/util/image_asset_constants.dart';
import 'package:enos_portfolio/util/media_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../../util/custom_colors.dart';

class Description extends StatelessWidget {
  final bool isVertical;
  final double width;

  const Description({required this.isVertical, required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
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
          Text(ContentConstants.hello, style: theme.textTheme.bodyMedium),
          Text(ContentConstants.name, style: theme.textTheme.displayLarge),
          const SizedBox(height: 4.0),
          Text(ContentConstants.tagline,
            style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
                // color: theme.colorScheme.onPrimary.withValues(alpha: 0.65)),
                color: theme.colorScheme.onPrimary.withOpacity(0.65)),
          ),
          const SizedBox(height: 16.0),
          Text(ContentConstants.taglineDescription,
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 48.0),
          InkWell(
            onTap: () async => !await launch(
                'https://mail.google.com/mail/u/0/?fs=1&to=${MediaConstants.email}&tf=cm'),
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
                  Text(ContentConstants.getInTouch,
                      style: theme.textTheme.labelLarge),
                  const SizedBox(width: 16.0),
                  Image.asset(ImageAssetConstants.addressBook, width: 24.0, height: 24.0, color: theme.colorScheme.onPrimary,),
                ],
              ),
            ),
          )
        ],
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
