import 'package:flutter/material.dart';

class RenderIconWithSwitch extends StatefulWidget {
  const RenderIconWithSwitch({super.key, required this.icon});

  final Icon icon;

  @override
  State<RenderIconWithSwitch> createState() => _RenderIconWithSwitchState();
}

class _RenderIconWithSwitchState extends State<RenderIconWithSwitch> {
  final EdgeInsets padding =  const EdgeInsets.all(8.0);
  final double optionsItemContainerHeight = 50;
  final double optionsItemContainerWidth = 120;
  final Color optionsItemContainerBackgroundColor = const Color(0x854D6EA3);
  final BorderRadius optionsItemContainerBorderRadius = BorderRadius.circular(50.0);
  final Color switchActiveColor = Colors.teal;
  final Color switchActiveTrackColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    bool light = true;
    return Padding(
      padding: padding,
      child: Container(
        width: optionsItemContainerWidth,
        height: optionsItemContainerHeight,
        decoration: BoxDecoration(
          color: optionsItemContainerBackgroundColor,
          borderRadius: optionsItemContainerBorderRadius,
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: widget.icon,
            ),
            Material(
              color: Colors.transparent,
              child: Switch(
                // This bool value toggles the switch.
                value: light,
                activeColor: switchActiveColor,
                activeTrackColor: switchActiveTrackColor,
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    light = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
