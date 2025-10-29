import 'package:enos_portfolio/features/home/ui/widgets/about_images.dart';
import 'package:flutter/material.dart';
import '../../../../util/breakpoints.dart';
import '../../../../util/content_constants.dart';
import '../../../../util/custom_colors.dart';
import '../../../../util/image_asset_constants.dart';
import 'about_description.dart';
import 'description.dart';
import 'enos_image.dart';

// Purpose: Tell your story briefly and show personality.
//
// Content:
//
// Short bio (1–2 paragraphs).
//
// Key skills or tools (icons or badges).
//
// A small photo/avatar or illustration.
//
// Download CV button.
class AboutSection extends StatelessWidget {
  final double width;
  final double height;
  const AboutSection({required this.width, required this.height, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      // height: height,
      color: theme.colorScheme.surface,
      // color: Colors.green,
      child: LayoutBuilder(builder: (context, consraints) {
        if (consraints.maxWidth >= Breakpoints.lg) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 48.0,
              ),
              Text(
                ContentConstants.aboutTitle,
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 24.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: AboutDescription(
                        isVertical: false,
                        width: width,
                      ),
                    ),
                    const SizedBox(width: 32.0),
                    Expanded(
                      flex: 3,
                      child: AboutSectionImages(
                        imageUrls: const [
                          ImageAssetConstants.enosPesakit,
                          ImageAssetConstants.enosFlutterForwardOfficials,
                          ImageAssetConstants.enosBoatRiding,
                        ],
                        height: 450,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 96.0),
            ],
          );
        } else if (consraints.maxWidth < Breakpoints.lg && consraints.maxWidth >= Breakpoints.md) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: width * 0.07),
              EnosImage(width: (2 * width) - 0.16 * width),
              SizedBox(height: 0.05 * width),
              Description(
                isVertical: true,
                width: width,
              ),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: width * 0.07),
              Center(child: EnosImage(width: 2 * width)),
              SizedBox(height: 0.05 * width),
              Description(isVertical: true, width: width),
            ],
          );
        }
      }),
    );
    return Container(
      width: width,
      // color: CustomColors.brightBackground,
      color: Colors.green,
      // padding: const EdgeInsets.only(bottom:20),
      child: LayoutBuilder(builder: (context, consraints) {
        if (consraints.maxWidth >= Breakpoints.lg) {
          return Container(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: width * 0.02),
                Description(
                  isVertical: false,
                  width: width,
                ),
                const SizedBox(width: 20),
                EnosImage(
                  width: width,
                )
              ],
            ),
          );
        } else if (consraints.maxWidth < Breakpoints.lg && consraints.maxWidth >= Breakpoints.md) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: width * 0.07),
              EnosImage(width: (2 * width) - 0.16 * width),
              SizedBox(height: 0.05 * width),
              Description(
                isVertical: true,
                width: width,
              ),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: width * 0.07),
              Center(child: EnosImage(width: 2 * width)),
              SizedBox(height: 0.05 * width),
              Description(isVertical: true, width: width),
            ],
          );
        }
      }),
    );
  }
}
