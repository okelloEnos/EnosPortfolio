import 'package:enos_portfolio/features/home/ui/widgets/nav_bar_item_with_icon.dart';
import 'package:enos_portfolio/util/content_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../util/breakpoints.dart';
import '../../../../util/custom_colors.dart';
import '../../../../util/image_asset_constants.dart';
import '../../../../util/media_constants.dart';
import 'logo.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final double width;
  final ScrollController scrollController;
  const Footer({required this.width,required this.scrollController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        color: CustomColors.darkBackground,
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Logo(width: width, scrollController: scrollController,),
             const SizedBox(height:22),
          width > Breakpoints.sm
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   Text('Copyright © 2023 okello-enos-dev',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                  Text('All rights reserved',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                  Text('enosokello@gmail.com',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                ],
              )
            : Column(
                children: [
                  Text('Copyright © 2023 okello-enos-dev',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                          const SizedBox(height: 10),
                          Text(' All rights reserved',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                  const SizedBox(height: 10),
                  Text('enosokello@gmail.com',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                ],
              ),
             
        ],)
              );
  }
}

class PortfolioFooter extends StatefulWidget {
  final double width;
  final ScrollController scrollController;
  const PortfolioFooter({required this.width,required this.scrollController, Key? key}) : super(key: key);

  @override
  State<PortfolioFooter> createState() => _PortfolioFooterState();
}

class _PortfolioFooterState extends State<PortfolioFooter> {
  bool isHoveringEmail = false;
  bool isHoveringPhone = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.surfaceTint,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 40),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
              ImageAssetConstants.logo,
              width: 200,
              height: 100),
          const SizedBox(height: 4.0),

          // Footer text
      Wrap(
        alignment: WrapAlignment.center,
        spacing: 12,
        runSpacing: 8,
        children: [
          Text('© ${DateTime.now().year} ${ContentConstants.name}', style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onPrimary.withValues(alpha: 0.5)
          )),
          Text(ContentConstants.contentSeparator, style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.5)
          )),
          Text(ContentConstants.reservedRights, style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.5)
          )),
          Text(ContentConstants.contentSeparator, style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.5)
          )),
          InkWell(
            onTap: () => launchUrl(Uri.parse('tel:${MediaConstants.phone}')),
            child: Text(MediaConstants.phone,
                style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.primary
                )),
          ),
          Text(ContentConstants.contentSeparator, style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.5)
          )),
          InkWell(
            onTap: () => launchUrl(Uri.parse('mailto:${MediaConstants.email}')),
            child: Text(MediaConstants.email,
                style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.primary
                )),
          ),
          ],),

          const SizedBox(height: 16.0),
          const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
            NavBarItemWithIcon(
              text: ContentConstants.github,
              icon: ImageAssetConstants.github,
              url: MediaConstants.github,
            ),
            SizedBox(width: 16.0),
            NavBarItemWithIcon(
                text: ContentConstants.linkedIn,
                icon: ImageAssetConstants.linkedIn,
                url: MediaConstants.linkedIn),
          ]),
        ],
      ),
    );
  }
}

