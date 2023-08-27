import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  String title = "Home";
  List<Widget> _pages = [];

  Color _categoryBackgroundColor = Color.fromARGB(81, 255, 247, 179);
  Color _homeBackgroundColor = Colors.white;
  Color _settingBackgroundColor = const Color.fromARGB(255, 255, 247, 179);
  Color colorSelected = Colors.white;

  @override
  void initState() {
    super.initState();
    _pages.add(categoryScreen());
    _pages.add(homeScreen());
    _pages.add(settingScreen());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    homeScreen();
    categoryScreen();
    settingScreen();
  }

  void updateTitle(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 0) {
        title = "Category";
        colorSelected = _categoryBackgroundColor;
      } else if (index == 1) {
        title = "Home";
        colorSelected = _homeBackgroundColor;
      } else if (index == 2) {
        title = "Settings";
        colorSelected = _settingBackgroundColor;
      }
    });
  }

  Widget homeScreen() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: _homeBackgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _showColorPicker(context, 1);
            },
            child: Text("Choose Color"),
          ),
        ],
      ),
    );
  }

  Widget categoryScreen() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: _categoryBackgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _showColorPicker(context, 0);
            },
            child: Text("Choose Color"),
          ),
        ],
      ),
    );
  }

  Widget settingScreen() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: _settingBackgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _showColorPicker(context, 2);
            },
            child: Text("Choose Color"),
          ),
        ],
      ),
    );
  }

  void _showColorPicker(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose a Color"),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: colorSelected,
              onColorChanged: (color) {
                setState(() {
                  colorSelected = color;
                  if (index == 0) {
                    _categoryBackgroundColor = colorSelected;
                  } else if (index == 1) {
                    _homeBackgroundColor = colorSelected;
                  } else if (index == 2) {
                    _settingBackgroundColor = colorSelected;
                  }
                });
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Text("Apply"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(title))),
      body: (BuildContext context, int index) {
        if (index == 0) {
          colorSelected = _categoryBackgroundColor;
          return categoryScreen();
        } else if (index == 1) {
          colorSelected = _homeBackgroundColor;
          return homeScreen();
        } else if (index == 2) {
          colorSelected = _settingBackgroundColor;
          return settingScreen();
        }
      }(context, _currentIndex),
      bottomNavigationBar: SizedBox(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          color: colorSelected,
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              height: kBottomNavigationBarHeight,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                ),
                child: BottomNavigationBar(
                    currentIndex: _currentIndex,
                    backgroundColor: Colors.blue,
                    selectedItemColor: Colors.white,
                    onTap: (index) {
                      setState(() {
                        updateTitle(index);
                      });
                    },
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.category), label: 'Category'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: ''),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.settings_outlined), label: 'Setting')
                    ]),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 1 ? Colors.blue : Colors.blueGrey,
          child: const Icon(Icons.home),
          onPressed: () => setState(() {
            updateTitle(1);
          }),
        ),
      ),
    );
  }
}
