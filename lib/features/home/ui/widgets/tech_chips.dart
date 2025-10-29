import 'package:enos_portfolio/features/home/ui/widgets/project_section.dart';
import 'package:flutter/material.dart';

class TechChips extends StatelessWidget {
  final ProjectEntity project;

  const TechChips({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final listOfTechs = (project.techUsed ?? <String>[]);
        final maxVisible = constraints.maxWidth >= 350
            ? 6
            : constraints.maxWidth >= 260
                ? 5
                : constraints.maxWidth >= 200
                    ? 4
                    : 1;

        final visible = listOfTechs.take(maxVisible).toList();
        final overflowCount = listOfTechs.length - visible.length;

        return Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children: [
            for (final t in visible) _buildTagChip(t ?? "", context),
            if (overflowCount > 0)
              InkWell(
                onTap: () => _showAllTags(context, listOfTechs),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    // color: theme.colorScheme.primary.withValues(alpha: 0.5),
                    color: theme.colorScheme.primary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    '+ $overflowCount',
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).hintColor.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 6.0,
                  runSpacing: 6.0,
                  children: [
                    for (final t in visible) _buildTagChip(t ?? "", context),
                    if (overflowCount > 0)
                      InkWell(
                        onTap: () => _showAllTags(context, listOfTechs),
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).hintColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            '+ $overflowCount',
                            style: TextStyle(
                              fontSize: 11,
                              color: Theme.of(context).hintColor.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTagChip(String tag, BuildContext ctx) {
    final theme = Theme.of(ctx);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      decoration: BoxDecoration(
        // color: theme.colorScheme.primary.withValues(alpha: 0.2),
        color: theme.colorScheme.primary.withOpacity( 0.2),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        tag,
        style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.primary),
      ),
    );
  }

  void _showAllTags(BuildContext context, List<String?> tags) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags.map((t) {
                return _buildTagChip(t ?? "", context);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
