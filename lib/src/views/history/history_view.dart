import 'package:calories_counter/src/views/history/history_viewModel.dart';
import 'package:calories_counter/src/views/pref_intake/pref_intake_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HistoryViewModel>.reactive(
      viewModelBuilder: () => HistoryViewModel(),
      onModelReady: (m) => m.init(),
      builder: (context, model, _) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 130,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: InkWell(
                onTap: () => navigateToPrefVew(context),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        // ignore: use_full_hex_values_for_flutter_colors
                        color: const Color(0xfecc4c33).withOpacity(0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Image.asset(
                        'assets/images/history/diet.png',
                        height: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 90,
                      child: Text(
                        'Diet info',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
          titleTextStyle: Theme.of(context).textTheme.headline6,
          title: Transform.translate(
            offset: const Offset(20, 0),
            child: const Text(
              'History',
              //style:,
            ),
          ),
        ),
        body: ListView.builder(
          // dragStartBehavior: DragStartBehavior.down,
          // reverse: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          itemCount: model.dates.length,
          itemBuilder: (context, index) => historyItem(
            context,
            model,
            index,
          ),
        ),
      ),
    );
  }

  Widget historyItem(
    BuildContext context,
    HistoryViewModel model,
    int index,
  ) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xffD7D7D7).withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  model.dates[index],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            children: [
              for (var i = 0; i < 6; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: model.colors[i].withOpacity(0.2),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Text(
                      '${model.data[index]["breakfast"]!.keys.elementAt(i)} = ${model.data[index]['breakfast']!.values.elementAt(i)}',
                      style: TextStyle(fontSize: 16, color: model.colors[i]),
                    ),
                  ),
                )
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void navigateToPrefVew(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => const PreferIntakeView()),
    );
  }
}
