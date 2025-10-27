import 'package:flutter/material.dart';
import '../../../../util/breakpoints.dart';
import '../../../../util/custom_colors.dart';
import 'description.dart';
import 'enos_image.dart';

//5. Purpose: Show professional journey or growth.
//
// Content:
//
// Timeline of roles, companies, and dates.
//
// Short description of impact in each role.
class ExperienceSection extends StatelessWidget {
  final double width;
  final double height;
  const ExperienceSection({required this.width, required this.height, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: CustomColors.brightBackground,
      // color: Colors.green,
      child: LayoutBuilder(builder: (context, consraints) {
        if (consraints.maxWidth >= Breakpoints.lg) {
          return Container(
            // color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200.0),
              child: Align(
                alignment: AlignmentDirectional.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Description(
                        isVertical: false,
                        width: width,
                      ),
                    ),
                    const SizedBox(width: 32.0),
                    EnosImage(
                      width: width,
                    ),
                  ],
                ),
              ),
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
