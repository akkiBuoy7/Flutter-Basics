import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class EnterButtonIntent extends Intent {}

class SelectButtonIntent extends Intent {}

class DownButtonIntent extends Intent {}

class UpButtonIntent extends Intent {}

class RightButtonIntent extends Intent {}

class LeftButtonIntent extends Intent {}

class IntentHandler {
  Widget handleKeyActions({required Widget child}) {
    return Shortcuts(
      child: child,
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftButtonIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowRight): RightButtonIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowUp): UpButtonIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowDown): DownButtonIntent(),
        LogicalKeySet(LogicalKeyboardKey.select): SelectButtonIntent(),
        LogicalKeySet(LogicalKeyboardKey.enter): EnterButtonIntent(),
      },
    );
  }
}
