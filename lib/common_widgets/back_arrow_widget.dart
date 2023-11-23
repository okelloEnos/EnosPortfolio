import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white38, shape: BoxShape.circle),
            child: const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
              child: Center(
                  child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
            )),
      ),
    );
  }
}

class BackArrowDynamic extends StatelessWidget {
  final Color? backgroundColor;
  final Color? arrowColor;
  const BackArrowDynamic({Key? key, this.backgroundColor, this.arrowColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                color: backgroundColor ?? Colors.white38, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
              child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: arrowColor ?? Colors.white,
                  )),
            )),
      ),
    );
  }
}

class BackArrowWithoutCenter extends StatelessWidget {
  const BackArrowWithoutCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 12.0, bottom: 12.0, right: 6.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: theme.colorScheme.primary,
              ),
            )),
      ),
    );
  }
}
