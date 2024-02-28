import 'package:flutter/material.dart';
import 'package:reseacue/components/icon_with_switch.dart';

class Modal extends StatefulWidget {
  const Modal({super.key});

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  final Color overlayBackgroundColor = Colors.white.withOpacity(0.7);
  final Radius overlayBorderRadius = const Radius.circular(25.0);
  final double overlayHeight = 350;
  final double overlayWidth = 400;
  final double overlayHeadingHeight = 60;
  final double overlayHeadingWidth = 400;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: overlayHeight,
        width: overlayWidth,
        decoration: BoxDecoration(
          color: overlayBackgroundColor,
          borderRadius: BorderRadius.all(
            overlayBorderRadius,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: overlayHeadingHeight,
              width: overlayHeadingWidth,
              decoration: BoxDecoration(
                color: const Color(0xBB30555F),
                borderRadius: BorderRadius.only(
                  topLeft: overlayBorderRadius,
                  topRight: overlayBorderRadius,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  renderHeading(),
                  renderCloseButton(),
                ],
              ),
            ),
            const RenderIconWithSwitch(
              icon: Icon(
                Icons.audiotrack,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget renderHeading() {
    return const Text(
      'OPTIONS',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget renderCloseButton() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.close_rounded,
      ),
    );
  }
}
