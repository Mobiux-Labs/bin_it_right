import 'package:flutter/material.dart';
import 'package:reseacue/widgets/overlays/pause_button.dart';

import '../../main.dart';

class PauseMenu extends StatelessWidget {
  static const String ID = 'PauseMenu';
  final TrashTrek gameRef;
  const PauseMenu({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 50.0,
            ),
            child: Text(
              'Paused',
              style: TextStyle(fontSize: 50.0, color: Colors.black, shadows: [
                Shadow(
                  blurRadius: 20.0,
                  color: Colors.white,
                  offset: Offset(0, 0),
                )
              ]),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/3,
            child: ElevatedButton(
              onPressed: (){
                gameRef.resumeEngine();
                gameRef.overlays.remove(PauseMenu.ID);
                gameRef.overlays.add(PauseButton.ID);
              }, child: Text('Resume'),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/3,
            child: ElevatedButton(
              onPressed: (){

              }, child: Text('Exit'),
            ),
          ),

        ],
      ),
    );
  }
}
