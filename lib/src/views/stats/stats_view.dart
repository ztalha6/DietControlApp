import 'package:calories_counter/src/views/stats/stats_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pie_chart/pie_chart.dart';
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
      onModelReady: (m) => m.getData(),
      builder: (context, model, _) => DefaultTabController(
        length: 1,
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
                    // Tab(
                    //   text: 'Weekly',
                    // ),
                    // Tab(
                    //   text: 'Monthly',
                    // ),
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
              if (model.noData)
                const Center(
                  child: Text(
                    'No data for today!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )
              else
                PieChart(
                  dataMap: model.dataMap,
                  animationDuration: const Duration(milliseconds: 1000),
                  chartLegendSpacing: 32,
                  chartRadius: MediaQuery.of(context).size.width / 1.3,
                  // colorList: colorList,
                  ringStrokeWidth: 32,
                  legendOptions: const LegendOptions(
                    legendPosition: LegendPosition.bottom,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValuesInPercentage: true,
                  ),
                  // gradientList: [
                  //   [
                  //     Color.fromRGBO(223, 250, 92, 1),
                  //     Color.fromRGBO(129, 250, 112, 1),
                  //   ],
                  //   [
                  //     Color.fromRGBO(129, 182, 205, 1),
                  //     Color.fromRGBO(91, 253, 199, 1),
                  //   ],
                  //   [
                  //     Color.fromRGBO(175, 63, 62, 1.0),
                  //     Color.fromRGBO(254, 154, 92, 1),
                  //   ]
                  // ],
                  // emptyColorGradient: [
                  //   Color(0xff6c5ce7),
                  //   Colors.blue,
                  // ],
                ),
              // Container(),
              // Container(),
            ],
          ),
        ),
      ),
    );
  }
}
