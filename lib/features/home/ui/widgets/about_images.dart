import 'package:flutter/material.dart';
import 'dart:ui' as ui;

// Usage example:
// ImageTriptych(
//   imageUrls: [
//     'https://.../img1.jpg',
//     'https://.../img2.jpg',
//     'https://.../img3.jpg',
//   ],
//   height: 420,
// )

class ImageTriptych extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final double gap;
  final double hoverScale;
  final double idleScale;
  final Duration duration;
  final BorderRadius borderRadius;

  const ImageTriptych({
    Key? key,
    required this.imageUrls,
    this.height = 420,
    this.gap = 12,
    this.hoverScale = 1.06,
    this.idleScale = 0.96,
    this.duration = const Duration(milliseconds: 280),
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  })  : assert(imageUrls.length == 3),
        super(key: key);

  @override
  State<ImageTriptych> createState() => _ImageTriptychState();
}

class _ImageTriptychState extends State<ImageTriptych> {
  int? _hoveredIndex; // null => none hovered

  // Returns a color matrix that lerps between identity and full grayscale
  // amount: 0.0 => identity, 1.0 => full grayscale
  List<double> _saturationMatrix(double amount) {
    // grayscale matrix (Rec. 709 luminance)
    final gray = <double>[
      0.2126, 0.7152, 0.0722, 0, 0, //
      0.2126, 0.7152, 0.0722, 0, 0, //
      0.2126, 0.7152, 0.0722, 0, 0, //
      0, 0, 0, 1, 0,
    ];

    // identity matrix
    final id = <double>[
      1, 0, 0, 0, 0, //
      0, 1, 0, 0, 0, //
      0, 0, 1, 0, 0, //
      0, 0, 0, 1, 0,
    ];

    // lerp id -> gray by amount
    List<double> out = List.filled(20, 0.0);
    for (int i = 0; i < 20; i++) {
      out[i] = id[i] + (gray[i] - id[i]) * amount;
    }
    return out;
  }

  void _onEnter(int index) {
    setState(() => _hoveredIndex = index);
  }

  void _onExit() {
    setState(() => _hoveredIndex = null);
  }

  void _onTap(int index) {
    // For touch, toggle the hovered image
    setState(() => _hoveredIndex = (_hoveredIndex == index) ? null : index);
  }

  @override
  Widget build(BuildContext context) {
    final urls = widget.imageUrls;
    return SizedBox(
      height: widget.height,
      child: Row(
        children: List.generate(3, (i) {
          final isHovered = _hoveredIndex == i;
          final anyHovered = _hoveredIndex != null;
          // scale and saturation logic:
          final double scale = isHovered
              ? widget.hoverScale
              : (anyHovered ? widget.idleScale : 1.0);
          // saturation amount:
          // - when none hovered: slightly desaturated (0.45)
          // - when hovered: hovered image -> 0.0 (full color)
          // - non-hovered when some hovered -> more desaturated (0.95)
          final double satAmount = !_hoveredIndexIsNotNull(anyHovered)
              ? 0.45
              : (isHovered ? 0.0 : 0.95);

          // spacing between items:
          final bool isFirst = i == 0;
          final bool isLast = i == 2;

          Widget child = AnimatedContainer(
            duration: widget.duration,
            curve: Curves.easeInOut,
            transform: Matrix4.identity()..scale(scale, scale),
            transformAlignment: Alignment.center,
            padding: EdgeInsets.only(
              left: isFirst ? 0 : widget.gap / 2,
              right: isLast ? 0 : widget.gap / 2,
            ),
            child: ClipRRect(
              borderRadius: widget.borderRadius,
              child: ColorFiltered(
                colorFilter: ColorFilter.matrix(_saturationMatrix(satAmount)),
                child: AspectRatio(
                  aspectRatio: 3 / 4, // portrait-like like screenshot
                  child: _buildImage(urls[i]),
                ),
              ),
            ),
          );

          // On desktop use MouseRegion for hover; on mobile fallback to tap.
          return Expanded(
            child: MouseRegion(
              onEnter: (_) => _onEnter(i),
              onExit: (_) => _onExit(),
              child: GestureDetector(
                onTap: () => _onTap(i),
                child: child,
              ),
            ),
          );
        }),
      ),
    );
  }

  // tiny helper to avoid an analyzer warning
  bool _hoveredIndexIsNotNull(bool anyHovered) => anyHovered;

  Widget _buildImage(String url) {
    // Replace NetworkImage with AssetImage if using local images.
    return Container(
      color: Colors.grey.shade200,
      child: Image.network(
        url,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: progress.expectedTotalBytes != null
                  ? progress.cumulativeBytesLoaded /
                  (progress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, st) => const Center(
          child: Icon(Icons.broken_image, size: 36),
        ),
      ),
    );
  }
}
