import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/remote_key/utils/custom_dropdown.dart';
import 'package:flutter_basics/remote_key/utils/custom_menu_item.dart';

import 'bloc/key_event_controller.dart';
import 'bottom_sheet.dart';

class RemoteKeyHomePage extends StatefulWidget {
  const RemoteKeyHomePage({Key? key}) : super(key: key);

  @override
  State<RemoteKeyHomePage> createState() => _RemoteKeyHomePageState();
}

class _RemoteKeyHomePageState extends State<RemoteKeyHomePage> {
  int _selectedIndex = 0;
  final List<String> _imagePaths = [
    "assets/images/demo_1.png",
    "assets/images/demo_2.png",
    "assets/images/demo_3.png",
    "assets/images/demo_4.png"
  ];
  int _selectedSortValue = 0;
  KeyEventController keyEventController = KeyEventController();

  List<CustomDropdownMenuItem> get dropdownItems {
    List<CustomDropdownMenuItem> menuItems = [
      CustomDropdownMenuItem(child: Text("Channel1"), value: "Channel1"),
      CustomDropdownMenuItem(child: Text("Channel2"), value: "Channel2"),
      CustomDropdownMenuItem(child: Text("Channel3"), value: "Channel3"),
      CustomDropdownMenuItem(child: Text("Channel4"), value: "Channel4"),
      CustomDropdownMenuItem(child: Text("Channel5"), value: "Channel5"),
    ];
    return menuItems;
  }

  String selectedDropdownItem = "Channel1";
  int _horizontalScrollIndex = 0;
  late FocusNode dropDownFocus;
  late FocusNode dialogBtnFocus;
  late FocusNode contentFocus;
  late FocusNode listFocus;
  late FocusNode listItemFocus;
  late FocusNode parentFocus;
  final GlobalKey dropDownKey = GlobalKey();
  late GestureDetector dialogBtnGestureDetector;

  @override
  void dispose() {
    _disposeFocusNodes();
    super.dispose();
  }

  @override
  void initState() {
    _initializeFocusNodes();
    super.initState();
  }

  _initializeFocusNodes() {
    dropDownFocus = FocusNode();
    dialogBtnFocus = FocusNode();
    contentFocus = FocusNode();
    listFocus = FocusNode();
    listItemFocus = FocusNode();
    parentFocus = FocusNode();
  }

  _disposeFocusNodes() {
    dropDownFocus.dispose();
    dialogBtnFocus.dispose();
    contentFocus.dispose();
    listFocus.dispose();
    listItemFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      onKey: (event) {
        _onEventKey(event);
      },
      autofocus: true,
      focusNode: parentFocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Container"),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Focus(
                        focusNode: dropDownFocus,
                        child: Container(
                          color: dropDownFocus.hasFocus ? Colors.black12 : null,
                          child: CustomDropdownButton(
                            key: dropDownKey,
                            value: selectedDropdownItem,
                            dropdownColor: Colors.grey,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            items: dropdownItems,
                            onChanged: (value) {
                              setState(() {
                                selectedDropdownItem = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Focus(
                        focusNode: dialogBtnFocus,
                        child: dialogBtnGestureDetector = GestureDetector(
                          onTap: () {
                            print("bottom sheet");
                            _buildBottomSheet("Random", "High rated first",
                                "Low rated first");
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            color:
                                dialogBtnFocus.hasFocus ? Colors.black12 : null,
                            child: Center(
                                child: Text(
                              "Show Dialog",
                              style: TextStyle(color: Colors.black),
                            )),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
            Flexible(
              flex: 3,
              child: Center(
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
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Focus(
                focusNode: listFocus,
                child: Container(

                  child: ListView.builder(
                      itemCount: _imagePaths.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return buildListContainer(index);
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onEventKey(RawKeyEvent event) {
    if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
      _handleUpKey();
    } else if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
      _handleDownKey();
    } else if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
      _handleLeftKey();
    } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
      _handleRightKey();
    } else if (event.isKeyPressed(LogicalKeyboardKey.select) ||
        (event.isKeyPressed(LogicalKeyboardKey.enter))) {
      _handleSelectKey();
    }
  }

  _handleUpKey() {
    print("****** Up key pressed ######");

    if (parentFocus.hasFocus) {
      _changeFocus(context, dialogBtnFocus);
    } else if (dialogBtnFocus.hasFocus || dropDownFocus.hasFocus) {
      _changeFocus(context, parentFocus);
    } else if (contentFocus.hasFocus) {
      _changeFocus(context, dropDownFocus);
    } else if (listFocus.hasFocus) {
      _changeFocus(context, contentFocus);
    }
  }

  _handleDownKey() {
    print("****** Down key pressed ######");
    print("****** dropDownFocus.hasFocus  ${dropDownFocus.hasFocus} ######");
    print("****** dialogBtnFocus.hasFocus  ${dialogBtnFocus.hasFocus} ######");
    if (dialogBtnFocus.hasFocus || dropDownFocus.hasFocus) {
      print("content focus");
      _changeFocus(context, listFocus);
    } else if (contentFocus.hasFocus) {
      _changeFocus(context, listFocus);
    }
  }

  _handleLeftKey() {
    print("****** Left key pressed ######");
    if (dialogBtnFocus.hasFocus) {
      _changeFocus(context, dropDownFocus);
    }
    if(listFocus.hasFocus){
      setState(() {
        if(_horizontalScrollIndex>0){
          _horizontalScrollIndex = _horizontalScrollIndex - 1;
          _selectedIndex = _horizontalScrollIndex;

        }
      });
    }
  }

  _handleRightKey() {
    print("****** Right key pressed ######");
    _logFocusStatus();
    if (dropDownFocus.hasFocus) {
      _changeFocus(context, dialogBtnFocus);
    }else if(listFocus.hasFocus){
      print("****** Right key traverse ######");
      setState(() {
        if(_horizontalScrollIndex<_imagePaths.length-1){
          _horizontalScrollIndex = _horizontalScrollIndex + 1;
          _selectedIndex = _horizontalScrollIndex;
        }
      });
    }
  }

  _handleSelectKey() {
    _logFocusStatus();
    if (dialogBtnFocus.hasFocus) {
      dialogBtnGestureDetector.onTap!();
      print("****** Select key pressed ######");
    }

    if(dropDownFocus.hasFocus){
      CustomDropdownButtonState dropDownState = dropDownKey.currentState as CustomDropdownButtonState;
      dropDownState.onCallTap();
    }
  }

  _changeFocus(BuildContext context, FocusNode focusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(focusNode);
      _logFocusStatus();
    });
  }

  _logFocusStatus(){
    Future.delayed(const Duration(milliseconds: 1000), () {
      print("#*#*# ${parentFocus.hasFocus}");
      print("contentFocus: ${contentFocus.hasFocus}");
      print("listFocus: ${listFocus.hasFocus}");
      print("listItemFocus: ${listItemFocus.hasFocus}");
      print("dialogBtnFocus: ${dialogBtnFocus.hasFocus}");
      print("dropDownFocus: ${dropDownFocus.hasFocus}");
    });
  }

  _buildBottomSheet(String first, String second, String third) {
    return showModalBottomSheet(
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
}
