import 'package:enos_portfolio/util/image_asset_constants.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedDownArrow extends StatefulWidget {
  const AnimatedDownArrow({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<AnimatedDownArrow> createState() => _AnimatedDownArrowState();
}

class _AnimatedDownArrowState extends State<AnimatedDownArrow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _animation,
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: IconButton(
        icon: Image.asset(ImageAssetConstants.doubleArrowDown, width: 24, height: 24,
            // color: theme.colorScheme.onPrimary.withValues(alpha: 0.5)),
            color: theme.colorScheme.onPrimary.withOpacity(0.5)),
        // icon: const Icon(
        //   Icons.keyboard_arrow_down_rounded,
        //   size: 40,
        //   color: Colors.white70,
        // ),
        onPressed: widget.onPressed,
      ),
    );
  }
}

class FadeOnScrollArrow extends StatefulWidget {
  /// The scroll controller you already use for the page.
  final ScrollController scrollController;

  /// The key for the next section to scroll to (optional).
  final GlobalKey? nextSectionKey;

  /// How many pixels of scroll it should take to fade from 1 -> 0.
  final double fadeDistance;

  /// Distance from bottom of hero.
  final double bottomPadding;

  const FadeOnScrollArrow({
    Key? key,
    required this.scrollController,
    this.nextSectionKey,
    this.fadeDistance = 250.0,
    this.bottomPadding = 20.0,
  }) : super(key: key);

  @override
  _FadeOnScrollArrowState createState() => _FadeOnScrollArrowState();
}

class _FadeOnScrollArrowState extends State<FadeOnScrollArrow> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
    _onScroll(); // init
  }

  void _onScroll() {
    final offset = widget.scrollController.hasClients
        ? widget.scrollController.offset
        : 0.0;

    // Convert offset -> opacity (1 -> 0 over fadeDistance)
    double t = (offset / math.max(1, widget.fadeDistance)).clamp(0.0, 1.0);
    final newOpacity = 1.0 - t;

    // Only update when there's a visible change to avoid excessive setState
    if ((newOpacity - _opacity).abs() > 0.01) {
      setState(() => _opacity = newOpacity);
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _scrollToNextSection() {
    if (widget.nextSectionKey?.currentContext != null) {
      Scrollable.ensureVisible(
        widget.nextSectionKey!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
      return;
    }

    // fallback scroll by a fixed amount (hero height / viewport) if next key not provided
    if (widget.scrollController.hasClients) {
      widget.scrollController.animateTo(
        widget.scrollController.offset + (MediaQuery.of(context).size.height * 0.9),
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // If fully invisible, we can not render to save paint.
    if (_opacity <= 0.01) return const SizedBox.shrink();

    return Positioned(
      left: 0,
      right: 0,
      bottom: widget.bottomPadding,
      child: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 120),
          // child: IconButton(
          //   onPressed: _scrollToNextSection,
          //   icon: const Icon(
          //     Icons.keyboard_arrow_down_rounded,
          //     size: 40,
          //     color: Colors.white70,
          //   ),
          // ),
          child: AnimatedDownArrow(onPressed: _scrollToNextSection),
        ),
      ),
    );
  }
}

