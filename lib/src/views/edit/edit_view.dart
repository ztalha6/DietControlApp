import 'package:calories_counter/src/views/edit/edit_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

// ignore: must_be_immutable
class EditView extends StatelessWidget {
  Map<String, Map<String, int>> data;
  String date;
  EditView({Key? key, required this.data, required this.date})
      : super(key: key);

  TextStyle activeTextStyle() => const TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontSize: 14.0,
      );
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditViewModel>.reactive(
      viewModelBuilder: () => EditViewModel(),
      onModelReady: (m) => m.init(data, date),
      builder: (context, model, _) => DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: false,
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
                      text: 'Breakfast',
                    ),
                    Tab(
                      text: 'Lunch',
                    ),
                    Tab(
                      text: 'Dinner',
                    ),
                    Tab(
                      text: 'Snacks',
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
            toolbarHeight: 130,
            titleTextStyle: Theme.of(context).textTheme.headline6,
            title: Transform.translate(
              offset: const Offset(0, 0),
              child: const Text(
                'Details',
                //style:,
              ),
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.500,
                child: TabBarView(
                  children: [
                    intakeTypes(
                      context,
                      model,
                      tabNumber: 0,
                      // dietLists: model.dietData['breakfast']!,
                    ),
                    intakeTypes(
                      context,
                      model,
                      tabNumber: 1,
                      // dietLists: model.dietData['lunch']!,
                    ),
                    intakeTypes(
                      context,
                      model,
                      tabNumber: 2,
                      // dietLists: model.dietData['dinner']!,
                    ),
                    intakeTypes(
                      context,
                      model,
                      tabNumber: 3,
                      // dietLists: model.dietData['snacks']!,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {
                    model.saveData(context);
                  },
                  color: model.toggleEdit
                      ? Theme.of(context).primaryColor.withOpacity(0.2)
                      : const Color(0xff38DB7A).withOpacity(0.2),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    !model.toggleEdit ? "Edit" : 'Save',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: model.toggleEdit
                          ? Theme.of(context).primaryColor
                          : const Color(0xff38DB7A),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget intakeTypes(
    BuildContext context,
    EditViewModel model, {
    required int tabNumber,
    // required Map<String, Map<String, int>> dietLists,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 20,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: [
                for (var i = 0; i < 6; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 10),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: model.colors[i].withOpacity(0.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Text(
                            model.toggleEdit
                                ? model.getCatagoryNameFromIndexs(tabNumber, i)
                                : '${model.getCatagoryNameFromIndexs(tabNumber, i)} = ${model.getcount(tabNumber, i)}',
                            style:
                                TextStyle(fontSize: 16, color: model.colors[i]),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: model.toggleEdit,
                        child: Container(
                          decoration: BoxDecoration(
                            // ignore: use_full_hex_values_for_flutter_colors
                            color: const Color(0xFF84A94F).withOpacity(0.2),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width / 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 32,
                                height: 32,
                                // ignore: deprecated_member_use
                                child: FlatButton(
                                  onPressed: () =>
                                      model.incrementItem(tabNumber, i),
                                  color: const Color.fromARGB(
                                    255,
                                    254,
                                    114,
                                    76,
                                  ),
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Color.fromARGB(
                                        255,
                                        39,
                                        45,
                                        47,
                                      ),
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  textColor: const Color.fromARGB(
                                    255,
                                    0,
                                    0,
                                    0,
                                  ),
                                  // ignore: use_named_constants
                                  padding: const EdgeInsets.all(0),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                model.getcount(tabNumber, i).toString(),
                              ),
                              SizedBox(
                                width: 32,
                                height: 32,
                                // ignore: deprecated_member_use
                                child: FlatButton(
                                  onPressed: () =>
                                      model.decrementItem(tabNumber, i),
                                  color: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Color.fromARGB(
                                        255,
                                        39,
                                        45,
                                        47,
                                      ),
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  textColor: const Color.fromARGB(
                                    255,
                                    0,
                                    0,
                                    0,
                                  ),
                                  // ignore: use_named_constants
                                  padding: const EdgeInsets.all(0),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
