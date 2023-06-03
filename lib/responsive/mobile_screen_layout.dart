import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dressing_room/utils/colors.dart';
import 'package:dressing_room/utils/global_variable.dart';


class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: AppTheme.vinho,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: (_page == 0) ? AppTheme.nearlyWhite : Colors.grey,
            ),
            label: '',
            backgroundColor: AppTheme.nearlyWhite,
          ),
          
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: (_page == 2) ? AppTheme.nearlyWhite : Colors.grey,
              ),
              label: '',
              backgroundColor: AppTheme.nearlyWhite),
         
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: (_page == 4) ? AppTheme.nearlyWhite : Colors.grey,
            ),
            label: '',
            backgroundColor: AppTheme.nearlyWhite,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
