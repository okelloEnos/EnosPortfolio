import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/custom_colors.dart';

class NavBarItem extends StatelessWidget {
  final String text;
  final Function onTap;
  late final RxBool isHighlighted;
  NavBarItem({required this.text, required this.onTap, Key? key})
      : super(key: key) {
    isHighlighted = false.obs;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (value) {
        isHighlighted.value = true;
      },
      onExit: (value) {
        isHighlighted.value = false;
      },
      child: ObxValue<RxBool>((data) {
        return InkWell(
          splashColor: Colors.white60,
          onTap: () => onTap(),
          child: Container(
            height: 35.0,
            width: 60,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: data.value
                        ? CustomColors.primary
                        : Colors.white,
                    fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                data.value
                    ? Container(
                        width: text.length * 12.0,
                        height: 1,
                        color: CustomColors.primary,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        );
      }, isHighlighted),
    );
  }
}
