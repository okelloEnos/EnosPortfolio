import 'package:flutter/material.dart';
import '../../../../util/breakpoints.dart';
import '../../../../util/image_asset_constants.dart';

class Logo extends StatelessWidget {
  final double width;
  final ScrollController scrollController;
  const Logo({required this.width, required this.scrollController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => scrollController.animateTo(
          scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Image.asset(
            ImageAssetConstants.logo,
            width: width >= Breakpoints.xlg ? width * 0.16 : width * 0.16,
            height: width >= Breakpoints.xlg ? width * 0.1 : width * 0.1),
      ),
    );
  }
}
