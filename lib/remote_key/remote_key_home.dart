import 'package:flutter/material.dart';

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

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Channel1"), value: "Channel1"),
      DropdownMenuItem(child: Text("Channel2"), value: "Channel2"),
      DropdownMenuItem(child: Text("Channel3"), value: "Channel3"),
      DropdownMenuItem(child: Text("Channel4"), value: "Channel4"),
      DropdownMenuItem(child: Text("Channel5"), value: "Channel5"),
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
    //FocusScope.of(context).requestFocus(dropDownFocus);

    return Scaffold(
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
                        child: DropdownButton(
                          autofocus: true,
                          value: selectedDropdownItem,
                          dropdownColor: Colors.grey,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          items: dropdownItems,
                          onChanged: (String? value) {
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
                      autofocus: true,
                      focusNode: dialogBtnFocus,
                      child: GestureDetector(
                        onTap: () {
                          _buildBottomSheet(
                              "Random", "High rated first", "Low rated first");
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
              child: ListView.builder(
                  itemCount: _imagePaths.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return buildListContainer(index);
                  }),
            ),
          )
        ],
      ),
    );
  }

  _changeFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
    setState(() {});
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
