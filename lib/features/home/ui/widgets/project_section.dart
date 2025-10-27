import 'package:enos_portfolio/features/home/ui/widgets/about_description.dart';
import 'package:enos_portfolio/features/home/ui/widgets/about_images.dart';
import 'package:enos_portfolio/features/home/ui/widgets/past_projects.dart';
import 'package:enos_portfolio/util/image_asset_constants.dart';
import 'package:flutter/material.dart';
import '../../../../util/breakpoints.dart';
import '../../../../util/custom_colors.dart';
import 'description.dart';
import 'enos_image.dart';

//4. Purpose: Show real results and what you can build.
//
// Content:
//
// Featured projects with:
//
// Title, description, and tech used.
//
// Screenshots or demos (GIFs, carousels, or embedded videos).
//
// Links to GitHub, Play Store, or Live Demo.
//
// Optionally: “Load more” or filter by category.
class ProjectSection extends StatelessWidget {
  final double width;
  final double height;
  const ProjectSection({required this.width, required this.height, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // height: height,
      color: CustomColors.brightBackground,
      // color: Colors.green,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 200.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Interesting projects I've worked on...",
                style: TextStyle(
                    color: Colors.white, fontSize: 16)),
            SizedBox(height: 32.0),
            // Expanded(child: PastProjectsSection()),
            PastProjectsSection(),
          ],
        ),
      ),
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
