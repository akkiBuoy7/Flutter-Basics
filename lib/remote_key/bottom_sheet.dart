import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/remote_key/utils/IntentHandler.dart';

class CustomBottomSheet extends StatefulWidget {
  int? selectedValue;
  Function? callback;
  String? firstOption;
  String? secondOption;
  String? thirdOption;

  CustomBottomSheet(
      {this.selectedValue,
      this.callback,
      this.firstOption,
      this.secondOption,
      this.thirdOption});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  FocusNode focusNodeRandom = FocusNode();
  FocusNode focusNodeAscending = FocusNode();
  FocusNode focusNodeDescending = FocusNode();
  FocusNode focusBtnDone = FocusNode();

  @override
  Widget build(BuildContext context) {
    return IntentHandler().handleKeyActions(
      child: Container(
        height: 300,
        child: Column(
          children: [
            Expanded(
              child: Theme(
                data: Theme.of(context)
                    .copyWith(unselectedWidgetColor: Colors.grey),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10),
                  children: [
                    _randomActionHandle(
                      child: Focus(
                        focusNode: focusNodeRandom,
                        child: RadioListTile(
                            activeColor: Colors.red,
                            tileColor:  focusNodeRandom.hasFocus
                                ? Colors.black12
                                : null,
                            value: 0,
                            title: Text(
                              widget.firstOption!,
                              style: TextStyle(
                                  color: widget.selectedValue == 0
                                      ? Colors.red
                                      : Colors.black),
                            ),
                            groupValue: widget.selectedValue!,
                            onChanged: (value) {
                              setState(() {
                                widget.selectedValue = value;
                              });
                            }),
                      ),
                    ),
                    _ascendingActionHandle(
                      child: Focus(
                        focusNode: focusNodeAscending,
                        child: RadioListTile(
                            tileColor:  focusNodeAscending.hasFocus
                                ? Colors.black12
                                : null,
                            activeColor: Colors.red,
                            value: 1,
                            title: Text(widget.secondOption!,
                                style: TextStyle(
                                    color: widget.selectedValue == 1
                                        ? Colors.red
                                        : Colors.black)),
                            groupValue: widget.selectedValue!,
                            onChanged: (value) {
                              setState(() {
                                widget.selectedValue = value;
                              });
                            }),
                      ),
                    ),
                    _descendingActionHandle(
                      child: Focus(
                        focusNode: focusNodeDescending,
                        child: RadioListTile(
                          tileColor:  focusNodeDescending.hasFocus
                              ? Colors.black12
                              : null,
                            activeColor: Colors.red,
                            value: 2,
                            title: Text(widget.thirdOption!,
                                style: TextStyle(
                                    color: widget.selectedValue == 2
                                        ? Colors.red
                                        : Colors.black)),
                            groupValue: widget.selectedValue!,
                            onChanged: (value) {
                              setState(() {
                                widget.selectedValue = value;
                              });
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: _doneActionHandle(
                child: Focus(
                  focusNode: focusBtnDone,
                  child: ElevatedButton(
                      onPressed: () {
                        widget.callback!(widget.selectedValue);
                        Navigator.of(context).pop();
                      },
                      child: Text("Done")),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _changeFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
    setState(() {});
  }

  _randomActionHandle({required Widget child}) {
    return Actions(
      child: child,
      actions: <Type, Action<Intent>>{
        DownButtonIntent: CallbackAction<DownButtonIntent>(onInvoke: (intent) {
          print("******** random down clicked *******");
          _changeFocus(context, focusNodeAscending);
        }),
        UpButtonIntent: CallbackAction<UpButtonIntent>(onInvoke: (intent) {}),
        SelectButtonIntent:
            CallbackAction<SelectButtonIntent>(onInvoke: (intent) {}),
        EnterButtonIntent:
            CallbackAction<EnterButtonIntent>(onInvoke: (intent) {}),
      },
    );
  }

  _ascendingActionHandle({required Widget child}) {
    return Actions(
      child: child,
      actions: <Type, Action<Intent>>{
        DownButtonIntent: CallbackAction<DownButtonIntent>(onInvoke: (intent) {
          print("******** ascending down clicked *******");
          _changeFocus(context, focusNodeDescending);
        }),
        UpButtonIntent: CallbackAction<UpButtonIntent>(onInvoke: (intent) {
          print("******** ascending up clicked *******");
          _changeFocus(context, focusNodeRandom);
        }),
        SelectButtonIntent:
            CallbackAction<SelectButtonIntent>(onInvoke: (intent) {}),
        EnterButtonIntent:
            CallbackAction<EnterButtonIntent>(onInvoke: (intent) {}),
      },
    );
  }

  _descendingActionHandle({required Widget child}) {
    return Actions(
      child: child,
      actions: <Type, Action<Intent>>{
        DownButtonIntent: CallbackAction<DownButtonIntent>(onInvoke: (intent) {
          print("******** descending down clicked *******");
          _changeFocus(context, focusBtnDone);
        }),
        UpButtonIntent: CallbackAction<UpButtonIntent>(onInvoke: (intent) {
          print("******** descending up clicked *******");
          _changeFocus(context, focusNodeAscending);
        }),
        SelectButtonIntent:
            CallbackAction<SelectButtonIntent>(onInvoke: (intent) {}),
        EnterButtonIntent:
            CallbackAction<EnterButtonIntent>(onInvoke: (intent) {}),
      },
    );
  }

  _doneActionHandle({required Widget child}) {
    return Actions(
      child: child,
      actions: <Type, Action<Intent>>{
        DownButtonIntent:
            CallbackAction<DownButtonIntent>(onInvoke: (intent) {}),
        UpButtonIntent: CallbackAction<UpButtonIntent>(onInvoke: (intent) {
          print("******** descending up clicked *******");
          _changeFocus(context, focusNodeDescending);
        }),
        SelectButtonIntent:
            CallbackAction<SelectButtonIntent>(onInvoke: (intent) {
          widget.callback!(widget.selectedValue);
          Navigator.of(context).pop();
        }),
        EnterButtonIntent:
            CallbackAction<EnterButtonIntent>(onInvoke: (intent) {
          widget.callback!(widget.selectedValue);
          Navigator.of(context).pop();
        }),
      },
    );
  }
}
