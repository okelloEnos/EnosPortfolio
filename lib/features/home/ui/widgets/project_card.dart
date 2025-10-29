import 'package:enos_portfolio/features/home/ui/widgets/project_section.dart';
import 'package:enos_portfolio/features/home/ui/widgets/tech_chips.dart';
import 'package:enos_portfolio/util/image_asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../util/content_constants.dart';
import '../../../../util/media_constants.dart';

class ProjectCard extends StatelessWidget {
  final ProjectEntity project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 300,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(project.imageAsset ?? ImageAssetConstants.placeholder,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity
          )),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(project.tag ?? '',
                  style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onPrimary.withValues(alpha: 0.65)),
                ),
                Text(project.title ?? '',
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: 4.0),
                Text(
                  project.description ?? '',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 16.0),
                // Expanded(child: TechChips(project: project)),
                TechChips(project: project),
                const SizedBox(height: 24.0),
                InkWell(
                  onTap: () async => !await launchUrl(Uri.parse(
                      'https://mail.google.com/mail/u/0/?fs=1&to=${MediaConstants.email}&tf=cm')),
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          ContentConstants.viewProject,
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
              ],
            ),
          )),
        ],
      ),
    );
  }
}
