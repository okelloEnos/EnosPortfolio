import 'package:flutter/material.dart';

class AboutSectionImages extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final double gap;
  final Duration duration;
  final BorderRadiusGeometry idleBorderRadius;
  final BorderRadiusGeometry hoveredBorderRadius;
  final double hoveredFlex;
  final double idleFlex;
  final double gapCollapsedFactor;

  const AboutSectionImages({
    Key? key,
    required this.imageUrls,
    this.height = 450.0,
    this.gap = 8.0,
    this.duration = const Duration(milliseconds: 300),
    this.idleBorderRadius = const BorderRadius.all(Radius.circular(100.0)),
    this.hoveredBorderRadius = const BorderRadius.all(Radius.circular(24.0)),
    this.hoveredFlex = 4,
    this.idleFlex = 1,
    this.gapCollapsedFactor = 0.65,
  })  : assert(imageUrls.length == 3),
        super(key: key);

  @override
  State<AboutSectionImages> createState() => _AboutSectionImagesState();
}

class _AboutSectionImagesState extends State<AboutSectionImages> {
  int? _hoveredIndex;

  List<double> _saturationMatrix(double amount) {
    final gray = <double>[
      0.2126, 0.7152, 0.0722, 0, 0,
      0.2126, 0.7152, 0.0722, 0, 0,
      0.2126, 0.7152, 0.0722, 0, 0,
      0, 0, 0, 1, 0,
    ];

    final id = <double>[
      1, 0, 0, 0, 0,
      0, 1, 0, 0, 0,
      0, 0, 1, 0, 0,
      0, 0, 0, 1, 0,
    ];

    final out = List<double>.filled(20, 0.0);
    for (int i = 0; i < 20; i++) {
      out[i] = id[i] + (gray[i] - id[i]) * amount;
    }
    return out;
  }

  void _onEnter(int index) => setState(() => _hoveredIndex = index);
  void _onExit() => setState(() => _hoveredIndex = null);
  void _onTap(int index) =>
      setState(() => _hoveredIndex = (_hoveredIndex == index) ? null : index);

  @override
  Widget build(BuildContext context) {
    final urls = widget.imageUrls;

    return SizedBox(
      height: widget.height,
      child: LayoutBuilder(builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final bool anyHovered = _hoveredIndex != null;

        final List<double> flexes = List.generate(3, (i) {
          if (!anyHovered) return widget.idleFlex;
          return (_hoveredIndex == i) ? widget.hoveredFlex : widget.idleFlex;
        });

        final double flexSum =
        flexes.fold(0.0, (double a, double b) => a + b);

        final double targetGap =
        anyHovered ? widget.gap * widget.gapCollapsedFactor : widget.gap;

        final double gapSpace = targetGap * 2;
        final double usableWidth = (totalWidth - gapSpace).clamp(0.0, double.infinity);
        final List<double> targetWidths = flexes
            .map((f) => (usableWidth * (f / (flexSum == 0 ? 1 : flexSum))))
            .toList();

        List<Widget> children = [];
        for (int i = 0; i < 3; i++) {
          final bool isHovered = _hoveredIndex == i;

          // saturation logic:
          final double satAmount = !anyHovered ? 0.85 : (isHovered ? 0.0 : 1.0);

          final BorderRadiusGeometry radius = isHovered
              ? widget.hoveredBorderRadius
              : widget.idleBorderRadius;

          double targetParallaxX;
          if (!anyHovered) {
            targetParallaxX = 0.0;
          } else {
            if (_hoveredIndex == i) {
              targetParallaxX = 0.0;
            } else if (i == 0) {
              targetParallaxX = -12.0;
            } else if (i == 2) {
              targetParallaxX = 12.0;
            } else {
              targetParallaxX = 0.0;
            }
          }

          Widget item = AnimatedContainer(
            duration: widget.duration,
            curve: Curves.easeInOut,
            width: targetWidths[i],
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: radius,
            ),
            clipBehavior: Clip.antiAlias,
            child: ColorFiltered(
              colorFilter: ColorFilter.matrix(_saturationMatrix(satAmount)),
              child: _ParallaxImage(
                url: urls[i],
                targetOffsetX: targetParallaxX,
                duration: widget.duration,
              ),
            ),
          );

          // handlers
          children.add(
            MouseRegion(
              onEnter: (_) => _onEnter(i),
              onExit: (_) => _onExit(),
              child: GestureDetector(
                onTap: () => _onTap(i),
                behavior: HitTestBehavior.opaque,
                child: item,
              ),
            ),
          );

          // add animated gap except after last item
          if (i < 2) {
            children.add(AnimatedContainer(
              duration: widget.duration,
              curve: Curves.easeInOut,
              width: targetGap,
            ));
          }
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        );
      }),
    );
  }
}

class _ParallaxImage extends StatelessWidget {
  final String url;
  final double targetOffsetX;
  final Duration duration;

  const _ParallaxImage({
    Key? key,
    required this.url,
    required this.targetOffsetX,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: targetOffsetX),
      duration: duration,
      curve: Curves.easeInOut,
      builder: (context, dx, child) {
        return Transform.translate(
          offset: Offset(dx, 0),
          child: child,
        );
      },
      child: SizedBox.expand(
        child: Image.asset(
          url,
          fit: BoxFit.cover,
          errorBuilder: (context, error, st) => const Center(child: Icon(Icons.broken_image, size: 36)),
        ),
      ),
    );
  }
}