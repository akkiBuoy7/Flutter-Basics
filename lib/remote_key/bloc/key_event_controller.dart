import 'dart:async';

import 'package:flutter/cupertino.dart';

class KeyEventController{

  late StreamController<RawKeyEvent> keyBoardEvents;
  KeyEventController(){
   this.keyBoardEvents = StreamController<RawKeyEvent>.broadcast();
  }
}