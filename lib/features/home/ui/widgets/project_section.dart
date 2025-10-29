import 'package:enos_portfolio/features/home/ui/widgets/about_description.dart';
import 'package:enos_portfolio/features/home/ui/widgets/about_images.dart';
import 'package:enos_portfolio/features/home/ui/widgets/past_projects.dart';
import 'package:enos_portfolio/util/image_asset_constants.dart';
import 'package:flutter/material.dart';
import '../../../../util/breakpoints.dart';
import '../../../../util/content_constants.dart';
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
// 1. Creature Codex 1
// 2. Britam Android, iOS, and Web App 1
// 3. Personal Portfolio Website 1
// 17. Pixabay 1
// 5. RIDO

// 4. Open Source Contributions CPMIS
// 6. Gerrit Mobile 2
// 7. Field Champions 2
// 9. Maisha Loans 2
// 10. D3 Flight Tracker 2
// 11. Phamacare
// 12. M-gari 2
// 13. Subirah
// 14. Liquor Store
// 15. Mokodo Pay
// 16. Mvuvi App


// 18. Pesa Path f
// 19. ID Scanner package f

class ProjectSection extends StatelessWidget {
  final double width;
  final double height;
  const ProjectSection({required this.width, required this.height, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      // color: CustomColors.brightBackground,
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 48.0),
          Text(ContentConstants.projectTitle,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 32.0),
          const PastProjectsSection(),
        ],
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

class ProjectEntity {
  final String? title;
  final String? description;
  final List<String?>? techUsed;
  final String? imageAsset;
  final String? githubLink;
  final String? liveDemoLink;

  ProjectEntity({
    this.title,
    this.description,
    this.techUsed,
    this.imageAsset,
    this.githubLink,
    this.liveDemoLink,
  });
}

List<ProjectEntity> careerProjects = [
  ProjectEntity(
    title: 'Creature Codex',
    description:
        'A mobile app that provides a comprehensive database of mythical creatures from various cultures around the world.',
    techUsed: ['Flutter', 'Dart', 'Firebase'],
    imageAsset: ImageAssetConstants.creatureCodex,
    githubLink: '',
    liveDemoLink: '',
  ),
  ProjectEntity(
    title: 'Britam Mobile App',
    description:
        'An all-in-one insurance app that allows users to manage their policies, file claims, and access customer support.',
    techUsed: ['Flutter', 'Dart', 'REST API'],
    imageAsset: ImageAssetConstants.britam,
    githubLink: '',
    liveDemoLink: '',
  ),
  ProjectEntity(
    title: 'Personal Portfolio Website',
    description:
        'A personal portfolio website showcasing my projects, skills, and experience as a Flutter developer.',
    techUsed: ['Flutter', 'Dart', 'Firebase Hosting'],
    imageAsset: ImageAssetConstants.portfolio,
    githubLink: '',
    liveDemoLink: '',
  ),
  ProjectEntity(
    title: 'Pixabay Client App',
    description:
        'A mobile app that allows users to search and download high-quality images and videos from the Pixabay API.',
    techUsed: ['Flutter', 'Dart', 'Pixabay API'],
    imageAsset: ImageAssetConstants.pixabay,
    githubLink: '',
    liveDemoLink: '',
  ),
];