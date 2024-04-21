import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final String imagePath;
  final String score;
  final String label;
  final double fontSize;
  final double imageSize;
  final double labelFontSize;
  final double yOffset;
  final double heightFactor;
  final double padding;

  const ScoreCard({
    super.key,
    required this.imagePath,
    required this.score,
    this.fontSize = 50,
    this.imageSize = 40,
    this.labelFontSize = 30,
    required this.label,
    this.yOffset = 15,
    this.heightFactor = 9,
    this.padding = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
                transform: Matrix4.translationValues(0.0, yOffset, 0.0),
                height: MediaQuery.of(context).size.height / heightFactor,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                  color: const Color(0xFFD4AF13),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: padding, bottom: padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagePath,
                        width: imageSize,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AutoSizeText(
                        score,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.white,
                          fontFamily: 'Digitalt',
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            label,
            style: TextStyle(
              fontSize: labelFontSize,
              color: const Color(0xFF203800),
              fontFamily: 'Digitalt',
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}
