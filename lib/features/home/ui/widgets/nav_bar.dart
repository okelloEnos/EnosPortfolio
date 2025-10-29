import 'package:enos_portfolio/util/content_constants.dart';
import 'package:enos_portfolio/util/media_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../util/breakpoints.dart';
import '../../../../util/custom_colors.dart';
import '../../../../util/image_asset_constants.dart';
import 'logo.dart';
import 'nav_bar_button.dart';
import 'nav_bar_item.dart';
import 'nav_bar_item_with_icon.dart';

class NavBar extends StatelessWidget {
  final double width;
  final GlobalKey aboutSectionKey;
  final GlobalKey projectSectionKey;
  final ScrollController scrollController;
  late final RxDouble collapsableHeight;

  NavBar(
      {required this.width,
      required this.aboutSectionKey,
      required this.projectSectionKey,
      required this.scrollController,
      Key? key})
      : super(key: key) {
    collapsableHeight = 0.0.obs;
  }

  void scrollToWidgetByKey(GlobalKey key) {
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero); //this is global position
    double y = position.dy;
    scrollController.animateTo(y,
        duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget navBarRow = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Logo(width: width, scrollController: scrollController),
          const SizedBox(width: 16.0),
          const Spacer(),
          Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NavBarItem(
                  text: ContentConstants.home,
                  onTap: () {},
                ),
                NavBarItem(
                    text: ContentConstants.about, onTap: () => scrollToWidgetByKey(projectSectionKey)),
                // NavBarItem(
                //   text: 'Skills',
                //   onTap: () {},
                // ),
                NavBarItem(
                  text: ContentConstants.project,
                  onTap: () => scrollToWidgetByKey(aboutSectionKey),
                ),
                // NavBarItem(
                //   text: 'Experience',
                //   onTap: () {},
                // ),
                // NavBarItem(
                //   text: 'Certificates',
                //   onTap: () {},
                // ),
                // NavBarItem(
                //   text: 'Blog',
                //   onTap: () {},
                // ),
                // NavBarItem(
                //   text: 'Testimonials',
                //   onTap: () {},
                // ),
                // NavBarItem(
                //   text: 'Contact',
                //   onTap: () {},
                // ),
              ]),
          const Spacer(),
          const SizedBox(width: 16.0),
          Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(children: [
                  const NavBarItemWithIcon(
                    text: ContentConstants.github,
                    icon: ImageAssetConstants.github,
                    url: MediaConstants.github,
                  ),
                  const SizedBox(width: 16.0),
                  const NavBarItemWithIcon(
                      text: ContentConstants.linkedIn,
                      icon: ImageAssetConstants.linkedIn,
                      url: MediaConstants.linkedIn),
                  const SizedBox(width: 16.0),
                  InkWell(
                    onTap: () async => !await launchUrl(
                    Uri.parse('https://mail.google.com/mail/u/0/?fs=1&to=${MediaConstants.email}&tf=cm')
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(ContentConstants.viewResume,
                              style: theme.textTheme.labelMedium,
                          ),
                          const SizedBox(width: 8.0),
                          SvgPicture.asset(ImageAssetConstants.arrow,
                              colorFilter: ColorFilter.mode(theme.colorScheme.onPrimary, BlendMode.srcIn),
                              width: 18, height: 18),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      width: width >= Breakpoints.xlg
                          ? width * 0.06
                          : width * 0.03),
                ])
              ])
        ]);
    List<Widget>? navBarColumn = [
      NavBarItem(
          text: 'Home',
          onTap: () {
            collapsableHeight.value = 0.0;
          }),
      const SizedBox(width: 10),
      NavBarItem(
          text: 'Skills',
          onTap: () {
            scrollToWidgetByKey(projectSectionKey);
            collapsableHeight.value = 0.0;
          }),
      const SizedBox(width: 10),
      NavBarItem(
          text: 'Intrests',
          onTap: () {
            scrollToWidgetByKey(aboutSectionKey);
            collapsableHeight.value = 0.0;
          }),
      NavBarItem(
          text: 'github',
          onTap: () async {
            await launch(MediaConstants.github);
          }),
      NavBarItem(
          text: 'facebook',
          onTap: () async => await launch(MediaConstants.facebook)),
      NavBarItem(
          text: 'linkedIn',
          onTap: () async => await launch(MediaConstants.linkedIn)),
    ];
    return Stack(
      children: [
        ObxValue<RxDouble>((data) => AnimatedContainer(
                  margin: const EdgeInsets.only(top: 0.0),
                  duration: const Duration(milliseconds: 375),
                  curve: Curves.ease,
                  height: data.value,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary),
                  child: SingleChildScrollView(
                    child: Column(
                      children: navBarColumn,
                    ),
                  ),
                ), collapsableHeight),
        Container(
          color: theme.colorScheme.surface,
          height: 75.0,
          child: (width < Breakpoints.xlg)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: width * 0.04),
                        child: Logo(
                          width: width,
                          scrollController: scrollController,
                        )),
                    NavBarButton(
                        onPressed: () {
                          if (collapsableHeight.value == 0.0) {
                            collapsableHeight.value = 240.0;
                          } else if (collapsableHeight.value == 240.0) {
                            collapsableHeight.value = 0.0;
                          }
                        },
                        width: width),
                  ],
                )
              : navBarRow,
        ),
      ],
    );
  }
}
