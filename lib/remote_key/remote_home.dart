import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/remote_key/utils/IntentHandler.dart';
import 'package:flutter_basics/remote_key/utils/custom_dropdown.dart';

import 'bottom_sheet.dart';

class RemoteHomePage extends StatefulWidget {
  const RemoteHomePage({Key? key}) : super(key: key);

  @override
  State<RemoteHomePage> createState() => _RemoteHomePageState();
}

class _RemoteHomePageState extends State<RemoteHomePage> {
  int _selectedIndex = 0;
  final List<String> _imagePaths = [
    "assets/images/demo_1.png",
    "assets/images/demo_2.png",
    "assets/images/demo_3.png",
    "assets/images/demo_4.png"
  ];
  int _selectedSortValue = 0;
  int _horizontalScrollIndex = 0;
  final GlobalKey dropDownKey = GlobalKey();
  int dropDownIndex = 0;

  List<CustomDropdownMenuItem<String>> get dropdownItems {
    List<CustomDropdownMenuItem<String>> menuItems = [
      CustomDropdownMenuItem(child: Text("Channel1"), value: "Channel1"),
      CustomDropdownMenuItem(child: Text("Channel2"), value: "Channel2"),
      CustomDropdownMenuItem(child: Text("Channel3"), value: "Channel3"),
      CustomDropdownMenuItem(child: Text("Channel4"), value: "Channel4"),
      CustomDropdownMenuItem(child: Text("Channel5"), value: "Channel5"),
    ];
    return menuItems;
  }

  String selectedDropdownItem = "Channel1";

  FocusNode dropDownFocus = FocusNode();
  FocusNode dialogBtnFocus = FocusNode();
  FocusNode contentFocus = FocusNode();
  FocusNode listFocus = FocusNode();
  FocusNode listItemFocus = FocusNode();
  FocusNode parentFocus = FocusNode();

  @override
  void dispose() {
    dropDownFocus.dispose();
    dialogBtnFocus.dispose();
    contentFocus.dispose();
    listFocus.dispose();
    listItemFocus.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Container"),
        ),
        body: IntentHandler().handleKeyActions(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                          flex: 1,
                          child: _dropDownActionHandle(
                            Focus(
                              focusNode: dropDownFocus,
                              child: Container(
                                color: dropDownFocus.hasFocus
                                    ? Colors.black12
                                    : null,
                                child: CustomDropdownButton(
                                  autofocus: true,
                                  key: dropDownKey,
                                  value: selectedDropdownItem,
                                  dropdownColor: Colors.grey,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  items: dropdownItems,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedDropdownItem = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          child: _dialogBtnActionHandle(
                            child: Focus(
                              focusNode: dialogBtnFocus,
                              child: GestureDetector(
                                onTap: () {
                                  _buildBottomSheet("Random", "Ascending",
                                      "Descending", false);
                                },
                                child: Container(
                                  width: 100,
                                  height: 50,
                                  color: dialogBtnFocus.hasFocus
                                      ? Colors.black12
                                      : null,
                                  child: Center(
                                      child: Text(
                                    "Show Dialog",
                                    style: TextStyle(color: Colors.black),
                                  )),
                                ),
                              ),
                            ),
                          ))
                    ]),
              ),
              Flexible(
                flex: 3,
                child: Center(
                  child: _mainContentHandle(
                      child: Focus(
                    focusNode: contentFocus,
                    child: Container(
                      decoration: BoxDecoration(
                          color: contentFocus.hasFocus ? Colors.black12 : null,
                          borderRadius: BorderRadius.circular(10)),
                      height: 300,
                      width: 300,
                      child: Image.asset(_imagePaths[_selectedIndex]),
                    ),
                  )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Focus(
                  focusNode: listFocus,
                  child: ListView.builder(
                      itemCount: _imagePaths.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _listActionHandle(
                            child: buildListContainer(index), index: index);
                      }),
                ),
              )
            ],
          ),
        ));
  }

  _changeFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
    setState(() {});
  }

  _buildBottomSheet(
      String first, String second, String third, bool isSortingFilter) {
    return showModalBottomSheet(
        enableDrag: false,
        isDismissible: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        context: context,
        builder: (BuildContext context) {
          return CustomBottomSheet(
            selectedValue: _selectedSortValue,
            firstOption: first,
            secondOption: second,
            thirdOption: third,
            callback: (value) {
              _selectedSortValue = value;
              print("######### Selected value is ${value}");
            },
          );
        });
  }

  Padding buildListContainer(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Focus(
          focusNode: listItemFocus,
          child: Container(
            decoration: BoxDecoration(
                border: _selectedIndex == index
                    ? Border.all(color: Colors.red, width: 5)
                    : null,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              _imagePaths[index],
            ),
          ),
        ),
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  _dropDownActionHandle(Widget child) {
    return Actions(
      child: child,
      actions: <Type, Action<Intent>>{
        RightButtonIntent:
            CallbackAction<RightButtonIntent>(onInvoke: (intent) {
          print("*** Dropdown right clicked ***");
          return _changeFocus(context, dialogBtnFocus);
        }),
        DownButtonIntent: CallbackAction<DownButtonIntent>(onInvoke: (intent) {
          print("*** Dropdown down clicked ***");
          return _changeFocus(context, contentFocus);
        }),
        SelectButtonIntent:
            CallbackAction<SelectButtonIntent>(onInvoke: (intent) {
          print("*** Dropdown select clicked ***");
          CustomDropdownButtonState dropDownState = dropDownKey.currentState as CustomDropdownButtonState;
          dropDownState.onCallTap();
          //_changeFocus(context, dialogBtnFocus);
        }),
        EnterButtonIntent:
            CallbackAction<EnterButtonIntent>(onInvoke: (intent) {
          print("*** Dropdown enter clicked ***");
          CustomDropdownButtonState dropDownState = dropDownKey.currentState as CustomDropdownButtonState;
          dropDownState.onCallTap();
          //_changeFocus(context, dialogBtnFocus);
        }),
      },
    );
  }

  _dialogBtnActionHandle({required Widget child}) {
    return Actions(
      child: child,
      actions: <Type, Action<Intent>>{
        RightButtonIntent:
            CallbackAction<RightButtonIntent>(onInvoke: (intent) {
          print("*** dialogBtn right clicked ***");
          return _changeFocus(context, dropDownFocus);
        }),
        LeftButtonIntent: CallbackAction<LeftButtonIntent>(onInvoke: (intent) {
          print("*** dialogBtn left clicked ***");
          return _changeFocus(context, dropDownFocus);
        }),
        DownButtonIntent: CallbackAction<DownButtonIntent>(onInvoke: (intent) {
          print("*** dialogBtn down clicked ***");
          return _changeFocus(context, contentFocus);
        }),
        SelectButtonIntent:
            CallbackAction<SelectButtonIntent>(onInvoke: (intent) {
          print("*** dialogBtn select clicked ***");
          _buildBottomSheet("Random", "Ascending", "Descending", false);
        }),
        EnterButtonIntent:
            CallbackAction<EnterButtonIntent>(onInvoke: (intent) {
          print("*** dialogBtn enter clicked ***");
          _buildBottomSheet("Random", "Ascending", "Descending",
              false); //_changeFocus(context, dialogBtnFocus);
        }),
      },
    );
  }

  _mainContentHandle({required Widget child}) {
    return Actions(
      child: child,
      actions: <Type, Action<Intent>>{
        UpButtonIntent: CallbackAction<UpButtonIntent>(onInvoke: (intent) {
          print("*** mainContent right clicked ***");
          _changeFocus(context, dialogBtnFocus);
        }),
        DownButtonIntent: CallbackAction<DownButtonIntent>(onInvoke: (intent) {
          print("*** mainContent down clicked ***");
          _changeFocus(context, listItemFocus);
        }),
        SelectButtonIntent:
            CallbackAction<SelectButtonIntent>(onInvoke: (intent) {
          print("*** mainContent select clicked ***");
          //_changeFocus(context, dialogBtnFocus);
        }),
        EnterButtonIntent:
            CallbackAction<EnterButtonIntent>(onInvoke: (intent) {
          print("*** mainContent enter clicked ***");
          //_changeFocus(context, dialogBtnFocus);
        }),
      },
    );
  }

  _listActionHandle({required Widget child, required int index}) {
    return Actions(
      child: child,
      actions: <Type, Action<Intent>>{
        RightButtonIntent:
            CallbackAction<RightButtonIntent>(onInvoke: (intent) {
          setState(() {
            if(_horizontalScrollIndex<_imagePaths.length-1){
              _horizontalScrollIndex = _horizontalScrollIndex + 1;
              _selectedIndex = _horizontalScrollIndex;
            }
          });
          print("*** list right clicked ${_horizontalScrollIndex}***");
        }),
        UpButtonIntent:
        CallbackAction<UpButtonIntent>(onInvoke: (intent) {
          setState(() {
            _changeFocus(context, contentFocus);
          });
          print("*** list up clicked ${_horizontalScrollIndex}***");
        }),
        LeftButtonIntent: CallbackAction<LeftButtonIntent>(onInvoke: (intent) {
          print("*** list left clicked ${_horizontalScrollIndex}***");
          setState(() {
            if(_horizontalScrollIndex>0){
              _horizontalScrollIndex = _horizontalScrollIndex - 1;
              _selectedIndex = _horizontalScrollIndex;

            }
          });
        }),
        SelectButtonIntent:
            CallbackAction<SelectButtonIntent>(onInvoke: (intent) {
          print("*** list select clicked ${_horizontalScrollIndex}***");
          setState(() {
            _selectedIndex = _horizontalScrollIndex;

          });
        }),
        EnterButtonIntent:
            CallbackAction<EnterButtonIntent>(onInvoke: (intent) {
          //_changeFocus(context, dialogBtnFocus);
        }),
      },
    );
  }


}
