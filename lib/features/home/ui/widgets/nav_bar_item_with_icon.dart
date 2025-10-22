import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../util/custom_colors.dart';

class NavBarItemWithIcon extends StatelessWidget {
  final String text;
  final String icon;
  final String url;

  const NavBarItemWithIcon(
      {required this.text, required this.icon, required this.url, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all<Color>(
            CustomColors.brightBackground),
      ),
      // icon: Image.asset(icon),
      icon: SvgPicture.asset(icon, color: Colors.white, width: 18, height: 18),
      onPressed: () async {
        await launch(url);
      },
      label: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }
}
