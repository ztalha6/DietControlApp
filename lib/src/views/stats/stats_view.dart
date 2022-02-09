import 'package:calories_counter/src/views/stats/stats_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class StatsView extends StatelessWidget {
  const StatsView({Key? key}) : super(key: key);
  TextStyle activeTextStyle() => const TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontSize: 14.0,
      );
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatsViewModel>.reactive(
      viewModelBuilder: () => StatsViewModel(),
      builder: (context, model, _) => DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: false,
            toolbarHeight: 136,
            titleTextStyle: Theme.of(context).textTheme.headline6,
            title: Transform.translate(
              offset: const Offset(20, 0),
              child: const Text(
                'Stats',
                //style:,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size(0, 40),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.10),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
                  unselectedLabelStyle: activeTextStyle(),
                  labelStyle: activeTextStyle(),
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  physics: const BouncingScrollPhysics(),
                  labelPadding: const EdgeInsets.fromLTRB(16, 3, 16, 3),
                  tabs: const [
                    Tab(
                      text: 'Daily',
                    ),
                    Tab(
                      text: 'Weekly',
                    ),
                    Tab(
                      text: 'Monthly',
                    ),
                  ],
                  indicator: RectangularIndicator(
                    color: Theme.of(context).primaryColor.withOpacity(0.30),
                    topLeftRadius: 25,
                    topRightRadius: 25,
                    bottomLeftRadius: 25,
                    bottomRightRadius: 25,
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
