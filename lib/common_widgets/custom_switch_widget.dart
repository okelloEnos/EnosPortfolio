import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool isSwitchOn;
  final Function(bool) onSwitchChanged;
  const CustomSwitch({super.key, required this.isSwitchOn, required this.onSwitchChanged});

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);

    return Switch(
      value: isSwitchOn,
      onChanged: onSwitchChanged,
      activeTrackColor: theme.colorScheme.secondary,
    );
  }
}
