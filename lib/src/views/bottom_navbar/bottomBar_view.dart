import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:calories_counter/src/views/account/account_view.dart';
import 'package:calories_counter/src/views/bottom_navbar/bottomBar_viewModel.dart';
import 'package:calories_counter/src/views/history/history_view.dart';
import 'package:calories_counter/src/views/home/home_view.dart';
import 'package:calories_counter/src/views/stats/stats_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavBarViewModel>.reactive(
      viewModelBuilder: () => BottomNavBarViewModel(),
      builder: (context, model, _) => Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: model.pageController,
            onPageChanged: (index) {
              model.currentIndex = index;
            },
            children: const <Widget>[
              HomeView(),
              StatsView(),
              HistoryView(),
              AccountView(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          containerHeight: 66,
          showElevation: false,
          selectedIndex: model.currentIndex,
          onItemSelected: (index) {
            model.currentIndex = index;
            model.pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            getBottomBarItem(context, 'Home', model.currentIndex, 0,
                'assets/images/bottomBar/home.png', Icon(Icons.home_outlined)),
            getBottomBarItem(
                context,
                'Stats',
                model.currentIndex,
                1,
                'assets/images/bottomBar/home.png',
                Icon(Icons.stacked_bar_chart_sharp)),
            getBottomBarItem(context, 'History', model.currentIndex, 2,
                'assets/images/bottomBar/home.png', Icon(Icons.history)),
            getBottomBarItem(
              context,
              'Profile',
              model.currentIndex,
              3,
              'assets/images/bottomBar/profile.png',
              Icon(Icons.person_outline_rounded),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavyBarItem getBottomBarItem(
    BuildContext context,
    String title,
    int currentIndex,
    int i,
    String iconPath,
    Icon icon,
  ) {
    return BottomNavyBarItem(
      textAlign: TextAlign.center,
      title: Text(
        title,
      ),
      icon: icon,
      // Image.asset(
      //   iconPath,
      //   height: 30,
      //   color: currentIndex == i
      //       ? Theme.of(context).primaryColor.withOpacity(0.8)
      //       : const Color(0xFF272D2F),
      // ),
      activeColor: Theme.of(context).primaryColor.withOpacity(0.8),
      inactiveColor: Colors.grey,
    );
  }
}
