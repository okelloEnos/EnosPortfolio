import 'package:enos_portfolio/features/home/ui/widgets/project_card.dart';
import 'package:enos_portfolio/features/home/ui/widgets/project_section.dart';
import 'package:flutter/material.dart';

class PastProjectsSection extends StatelessWidget {
  const PastProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
              height: 24.0,
            ),
      shrinkWrap: true,
        itemCount: careerProjects.length,
        itemBuilder: (context, index) {
        ProjectEntity project = careerProjects[index];
      return ProjectCard(project: project);
    });
  }
}
