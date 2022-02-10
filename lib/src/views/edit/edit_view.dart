import 'package:calories_counter/src/global/constants/widgets/input_widget.dart';
import 'package:calories_counter/src/views/edit/edit_viewModel.dart';
import 'package:calories_counter/src/views/home/home_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:stacked/stacked.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class EditView extends StatelessWidget {
  const EditView({Key? key}) : super(key: key);

  TextStyle activeTextStyle() => const TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontSize: 14.0,
      );
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditViewModel>.reactive(
      viewModelBuilder: () => EditViewModel(),
      onModelReady: (m) => m.init(),
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
              offset: const Offset(20, 0),
              child: const Text(
                'Details',
                //style:,
              ),
            ),
          ),
          body: TabBarView(
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
                            'dd',
                            style:
                                TextStyle(fontSize: 16, color: model.colors[i]),
                          ),
                        ),
                      ),
                      Container(
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
                                onPressed: () {},
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
                              '1',
                            ),
                            SizedBox(
                              width: 32,
                              height: 32,
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                onPressed: () => {},
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
                    ],
                  )
              ],
            ),
            // customExpandableWidget(
            //   leading: Transform.translate(
            //     offset: const Offset(50, 0),
            //     child: Image.asset(
            //       'assets/images/bottomBar/carb.png',
            //       height: 50,
            //     ),
            //   ),
            //   tileColor: const Color(0xFF84A94F).withOpacity(0.2),
            //   trailingColor: const Color(0xFF84A94F),
            //   titleColor: const Color(0xFF84A94F),
            //   title: 'carbs',
            //   childerns: [
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     SizedBox(
            //       height: 180,
            //       child: GridView.count(
            //         scrollDirection: Axis.horizontal,
            //         mainAxisSpacing: 10.0,
            //         crossAxisCount: 2,
            //         children: List.generate(
            //           5,
            //           (index) {
            //             return Center(
            //               child: Padding(
            //                 padding: const EdgeInsets.only(top: 10),
            //                 child: Stack(
            //                   children: [
            //                     // Visibility(
            //                     //   visible:
            //                     //       model.dietData[model.getTabNameFromIndexs(
            //                     //             tabNumber,
            //                     //           )]![model.getCatagoryNameFromIndexs(
            //                     //             tabNumber,
            //                     //             0,
            //                     //           )]![model.getItemNameFromIndexs(
            //                     //             tabNumber,
            //                     //             0,
            //                     //             index,
            //                     //           )] !=
            //                     //           0,
            //                     //   child: Transform.translate(
            //                     //     offset: const Offset(-5, -10),
            //                     //     child: Container(
            //                     //       height: 30,
            //                     //       width: 30,
            //                     //       decoration: BoxDecoration(
            //                     //         border: Border.all(
            //                     //           color: const Color(0xFF272D2F),
            //                     //         ),
            //                     //         color: const Color(0xFFFE724C),
            //                     //         borderRadius: const BorderRadius.all(
            //                     //           Radius.circular(20),
            //                     //         ),
            //                     //       ),
            //                     //       child: Center(
            //                     //         child: Text(
            //                     //           model
            //                     //               .getItemValueFromIndexs(
            //                     //                 tabNumber,
            //                     //                 0,
            //                     //                 index,
            //                     //               )
            //                     //               .toString(),
            //                     //           style: const TextStyle(
            //                     //             fontWeight: FontWeight.bold,
            //                     //             fontSize: 12,
            //                     //             color: Colors.white,
            //                     //           ),
            //                     //         ),
            //                     //       ),
            //                     //     ),
            //                     //   ),
            //                     // ),
            //                     // Visibility(
            //                     //   visible:
            //                     //       // dietLists['carbs']![0] != 0 &&
            //                     //       model.toggleDelete,
            //                     //   child: Transform.translate(
            //                     //     offset: const Offset(40, -10),
            //                     //     child: Container(
            //                     //       height: 40,
            //                     //       width: 40,
            //                     //       decoration: BoxDecoration(
            //                     //         border: Border.all(
            //                     //           color: const Color(0xFF272D2F),
            //                     //         ),
            //                     //         color: const Color(0xFFFE724C),
            //                     //         borderRadius: const BorderRadius.all(
            //                     //           Radius.circular(20),
            //                     //         ),
            //                     //       ),
            //                     //       child: Center(
            //                     //         child: IconButton(
            //                     //           icon: const Icon(
            //                     //             Icons.remove,
            //                     //             color: Colors.white,
            //                     //           ),
            //                     //           onPressed: () {},
            //                     //         ),
            //                     //       ),
            //                     //     ),
            //                     //   ),
            //                     // ),

            //                     // InkWell(
            //                     //   // ignore: avoid_print
            //                     //   // onTap: model.toggleDelete
            //                     //   //     ? null
            //                     //   //     : () => model.incrementItem(
            //                     //   //           tabNumber,
            //                     //   //           0,
            //                     //   //           index,
            //                     //   //         ),
            //                     //   // onLongPress: () =>
            //                     //   //     model.toggleDelete = !model.toggleDelete,
            //                     //   child:
            //                     Container(
            //                       width:
            //                           MediaQuery.of(context).size.width * 0.250,
            //                       height: 575,
            //                       decoration: BoxDecoration(
            //                         // ignore: use_full_hex_values_for_flutter_colors
            //                         color: const Color(0xFF84A94F)
            //                             .withOpacity(0.2),
            //                         borderRadius: const BorderRadius.all(
            //                           Radius.circular(15),
            //                         ),
            //                       ),
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(18.0),
            //                         child: Text(
            //                           'model.getItemNameFromIndexs( tabNumber,0,index,)',
            //                         ),
            //                       ),
            //                     ),
            //                     // ),

            //                     Positioned(
            //                       bottom: 1.0,
            //                       child: Container(
            //                         decoration: BoxDecoration(
            //                           // ignore: use_full_hex_values_for_flutter_colors
            //                           color: const Color(0xFF84A94F)
            //                               .withOpacity(0.2),
            //                           borderRadius: const BorderRadius.all(
            //                             Radius.circular(15),
            //                           ),
            //                         ),
            //                         width:
            //                             MediaQuery.of(context).size.width / 4,
            //                         child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             SizedBox(
            //                               width: 32,
            //                               height: 32,
            //                               // ignore: deprecated_member_use
            //                               child: FlatButton(
            //                                 onPressed: () {},
            //                                 color: const Color.fromARGB(
            //                                   255,
            //                                   254,
            //                                   114,
            //                                   76,
            //                                 ),
            //                                 shape: const RoundedRectangleBorder(
            //                                   side: BorderSide(
            //                                     color: Color.fromARGB(
            //                                       255,
            //                                       39,
            //                                       45,
            //                                       47,
            //                                     ),
            //                                     width: 1.5,
            //                                   ),
            //                                   borderRadius: BorderRadius.all(
            //                                     Radius.circular(16),
            //                                   ),
            //                                 ),
            //                                 textColor: const Color.fromARGB(
            //                                   255,
            //                                   0,
            //                                   0,
            //                                   0,
            //                                 ),
            //                                 // ignore: use_named_constants
            //                                 padding: const EdgeInsets.all(0),
            //                                 child: const Icon(
            //                                   Icons.add,
            //                                   color: Colors.white,
            //                                 ),
            //                               ),
            //                             ),
            //                             Text('sas'),
            //                             SizedBox(
            //                               width: 32,
            //                               height: 32,
            //                               // ignore: deprecated_member_use
            //                               child: FlatButton(
            //                                 onPressed: () {},
            //                                 color: Colors.white,
            //                                 shape: const RoundedRectangleBorder(
            //                                   side: BorderSide(
            //                                     color: Color.fromARGB(
            //                                       255,
            //                                       39,
            //                                       45,
            //                                       47,
            //                                     ),
            //                                     width: 1.5,
            //                                   ),
            //                                   borderRadius: BorderRadius.all(
            //                                     Radius.circular(16),
            //                                   ),
            //                                 ),
            //                                 textColor: const Color.fromARGB(
            //                                   255,
            //                                   0,
            //                                   0,
            //                                   0,
            //                                 ),
            //                                 // ignore: use_named_constants
            //                                 padding: const EdgeInsets.all(0),
            //                                 child: const Icon(
            //                                   Icons.remove,
            //                                   color: Colors.black,
            //                                 ),
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     InputWidget(
            //       controller: null,
            //       onChanged: (s) {},
            //       onDone: () {},
            //       onEditingComplete: () {},
            //       validator: (String? s) {},
            //       hintText: 'Enter any other option',
            //       borderColor: Colors.grey,
            //       cursorColor: const Color(0xFFFE724C),
            //       labelText: 'Other option',
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 30),
            //       // ignore: deprecated_member_use
            //       child: FlatButton(
            //         onPressed: () => {},
            //         color: const Color.fromARGB(51, 254, 114, 76),
            //         shape: const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(16)),
            //         ),
            //         textColor: const Color(0xFFFE724C),
            //         child: const Text(
            //           "Save",
            //           textAlign: TextAlign.left,
            //           style: TextStyle(
            //             color: Color(0xFFFE724C),
            //             fontWeight: FontWeight.bold,
            //             fontSize: 20,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // customExpandableWidget(
            //   leading: Transform.translate(
            //     offset: const Offset(30, 0),
            //     child: Image.asset(
            //       'assets/images/bottomBar/fish.png',
            //       height: 50,
            //     ),
            //   ),
            //   tileColor: const Color(0xFFBFBBB6).withOpacity(0.2),
            //   trailingColor: const Color(0xFFBFBBB6),
            //   titleColor: const Color(0xFFBFBBB6),
            //   title: 'Protein',
            //   childerns: [
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     SizedBox(
            //       height: 180,
            //       child: GridView.count(
            //         scrollDirection: Axis.horizontal,
            //         mainAxisSpacing: 10.0,
            //         crossAxisCount: 2,
            //         children: List.generate(
            //           model.getItemsLengthFromIndexs(tabNumber, 1),
            //           (index) {
            //             return Center(
            //               child: Padding(
            //                 padding: const EdgeInsets.only(top: 10),
            //                 child: Stack(
            //                   children: [
            //                     // Visibility(
            //                     //   visible:
            //                     //       model.dietData[model.getTabNameFromIndexs(
            //                     //             tabNumber,
            //                     //           )]![model.getCatagoryNameFromIndexs(
            //                     //             tabNumber,
            //                     //             1,
            //                     //           )]![model.getItemNameFromIndexs(
            //                     //             tabNumber,
            //                     //             1,
            //                     //             index,
            //                     //           )] !=
            //                     //           0,
            //                     //   child: Transform.translate(
            //                     //     offset: const Offset(-5, -10),
            //                     //     child: Container(
            //                     //       height: 30,
            //                     //       width: 30,
            //                     //       decoration: BoxDecoration(
            //                     //         border: Border.all(
            //                     //           color: const Color(0xFF272D2F),
            //                     //         ),
            //                     //         color: const Color(0xFFFE724C),
            //                     //         borderRadius: const BorderRadius.all(
            //                     //           Radius.circular(20),
            //                     //         ),
            //                     //       ),
            //                     //       child: Center(
            //                     //         child: Text(
            //                     //           model
            //                     //               .getItemValueFromIndexs(
            //                     //                 tabNumber,
            //                     //                 1,
            //                     //                 index,
            //                     //               )
            //                     //               .toString(),
            //                     //           style: const TextStyle(
            //                     //             fontWeight: FontWeight.bold,
            //                     //             fontSize: 12,
            //                     //             color: Colors.white,
            //                     //           ),
            //                     //         ),
            //                     //       ),
            //                     //     ),
            //                     //   ),
            //                     // ),
            //                     // Visibility(
            //                     //   visible:
            //                     //       // dietLists['carbs']![0] != 0 &&
            //                     //       model.toggleDelete,
            //                     //   child: Transform.translate(
            //                     //     offset: const Offset(40, -10),
            //                     //     child: Container(
            //                     //       height: 40,
            //                     //       width: 40,
            //                     //       decoration: BoxDecoration(
            //                     //         border: Border.all(
            //                     //           color: const Color(0xFF272D2F),
            //                     //         ),
            //                     //         color: const Color(0xFFFE724C),
            //                     //         borderRadius: const BorderRadius.all(
            //                     //           Radius.circular(20),
            //                     //         ),
            //                     //       ),
            //                     //       child: Center(
            //                     //         child: IconButton(
            //                     //           icon: const Icon(
            //                     //             Icons.remove,
            //                     //             color: Colors.white,
            //                     //           ),
            //                     //           onPressed: () {},
            //                     //         ),
            //                     //       ),
            //                     //     ),
            //                     //   ),
            //                     // ),

            //                     // InkWell(
            //                     //   // ignore: avoid_print
            //                     //   onTap: model.toggleDelete
            //                     //       ? null
            //                     //       : () => model.incrementItem(
            //                     //             tabNumber,
            //                     //             1,
            //                     //             index,
            //                     //           ),
            //                     //   onLongPress: () =>
            //                     //       model.toggleDelete = !model.toggleDelete,
            //                     //   child:
            //                     Container(
            //                       width: 250,
            //                       height: 75,
            //                       decoration: BoxDecoration(
            //                         // ignore: use_full_hex_values_for_flutter_colors
            //                         color: const Color(0xFFBFBBB6)
            //                             .withOpacity(0.2),
            //                         borderRadius: const BorderRadius.all(
            //                           Radius.circular(15),
            //                         ),
            //                       ),
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(18.0),
            //                         child: Text(
            //                           model.getItemNameFromIndexs(
            //                             tabNumber,
            //                             1,
            //                             index,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     // ),
            //                     Positioned(
            //                       bottom: 1.0,
            //                       child: Container(
            //                         decoration: BoxDecoration(
            //                           // ignore: use_full_hex_values_for_flutter_colors
            //                           color: const Color(0xFF84A94F)
            //                               .withOpacity(0.2),
            //                           borderRadius: const BorderRadius.all(
            //                             Radius.circular(15),
            //                           ),
            //                         ),
            //                         width:
            //                             MediaQuery.of(context).size.width / 4,
            //                         child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             SizedBox(
            //                               width: 32,
            //                               height: 32,
            //                               // ignore: deprecated_member_use
            //                               child: FlatButton(
            //                                 onPressed: () =>
            //                                     model.incrementItem(
            //                                   tabNumber,
            //                                   1,
            //                                   index,
            //                                 ),
            //                                 color: const Color.fromARGB(
            //                                   255,
            //                                   254,
            //                                   114,
            //                                   76,
            //                                 ),
            //                                 shape: const RoundedRectangleBorder(
            //                                   side: BorderSide(
            //                                     color: Color.fromARGB(
            //                                       255,
            //                                       39,
            //                                       45,
            //                                       47,
            //                                     ),
            //                                     width: 1.5,
            //                                   ),
            //                                   borderRadius: BorderRadius.all(
            //                                     Radius.circular(16),
            //                                   ),
            //                                 ),
            //                                 textColor: const Color.fromARGB(
            //                                   255,
            //                                   0,
            //                                   0,
            //                                   0,
            //                                 ),
            //                                 // ignore: use_named_constants
            //                                 padding: const EdgeInsets.all(0),
            //                                 child: const Icon(
            //                                   Icons.add,
            //                                   color: Colors.white,
            //                                 ),
            //                               ),
            //                             ),
            //                             Text(
            //                               model
            //                                   .getItemValueFromIndexs(
            //                                     tabNumber,
            //                                     1,
            //                                     index,
            //                                   )
            //                                   .toString(),
            //                             ),
            //                             SizedBox(
            //                               width: 32,
            //                               height: 32,
            //                               // ignore: deprecated_member_use
            //                               child: FlatButton(
            //                                 onPressed: () =>
            //                                     model.decrementItem(
            //                                   tabNumber,
            //                                   1,
            //                                   index,
            //                                 ),
            //                                 color: Colors.white,
            //                                 shape: const RoundedRectangleBorder(
            //                                   side: BorderSide(
            //                                     color: Color.fromARGB(
            //                                       255,
            //                                       39,
            //                                       45,
            //                                       47,
            //                                     ),
            //                                     width: 1.5,
            //                                   ),
            //                                   borderRadius: BorderRadius.all(
            //                                     Radius.circular(16),
            //                                   ),
            //                                 ),
            //                                 textColor: const Color.fromARGB(
            //                                   255,
            //                                   0,
            //                                   0,
            //                                   0,
            //                                 ),
            //                                 // ignore: use_named_constants
            //                                 padding: const EdgeInsets.all(0),
            //                                 child: const Icon(
            //                                   Icons.remove,
            //                                   color: Colors.black,
            //                                 ),
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     InputWidget(
            //       controller: null,
            //       onChanged: (s) {},
            //       onDone: () {},
            //       onEditingComplete: () {},
            //       validator: (String? s) {},
            //       hintText: 'Enter any other option',
            //       borderColor: Colors.grey,
            //       cursorColor: const Color(0xFFFE724C),
            //       labelText: 'Other option',
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 30),
            //       // ignore: deprecated_member_use
            //       child: FlatButton(
            //         onPressed: () => model.saveData(context),
            //         color: const Color.fromARGB(51, 254, 114, 76),
            //         shape: const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(16)),
            //         ),
            //         textColor: const Color(0xFFFE724C),
            //         child: const Text(
            //           "Save",
            //           textAlign: TextAlign.left,
            //           style: TextStyle(
            //             color: Color(0xFFFE724C),
            //             fontWeight: FontWeight.bold,
            //             fontSize: 20,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // customExpandableWidget(
            //   leading: Transform.translate(
            //     offset: const Offset(40, 0),
            //     child: Image.asset(
            //       'assets/images/bottomBar/orange.png',
            //       height: 50,
            //     ),
            //   ),
            //   tileColor: const Color(0xFFF3B65A).withOpacity(0.2),
            //   trailingColor: const Color(0xFFF3B65A),
            //   titleColor: const Color(0xFFF3B65A),
            //   title: 'Fruits',
            //   childerns: [
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     SizedBox(
            //       height: 180,
            //       child: GridView.count(
            //         scrollDirection: Axis.horizontal,
            //         mainAxisSpacing: 10.0,
            //         crossAxisCount: 2,
            //         children: List.generate(
            //           model.getItemsLengthFromIndexs(tabNumber, 2),
            //           (index) {
            //             return Center(
            //               child: Padding(
            //                 padding: const EdgeInsets.only(top: 10),
            //                 child: Stack(
            //                   children: [
            //                     // Visibility(
            //                     //   visible:
            //                     //       model.dietData[model.getTabNameFromIndexs(
            //                     //             tabNumber,
            //                     //           )]![model.getCatagoryNameFromIndexs(
            //                     //             tabNumber,
            //                     //             2,
            //                     //           )]![model.getItemNameFromIndexs(
            //                     //             tabNumber,
            //                     //             2,
            //                     //             index,
            //                     //           )] !=
            //                     //           0,
            //                     //   child: Transform.translate(
            //                     //     offset: const Offset(-5, -10),
            //                     //     child: Container(
            //                     //       height: 30,
            //                     //       width: 30,
            //                     //       decoration: BoxDecoration(
            //                     //         border: Border.all(
            //                     //           color: const Color(0xFF272D2F),
            //                     //         ),
            //                     //         color: const Color(0xFFFE724C),
            //                     //         borderRadius: const BorderRadius.all(
            //                     //           Radius.circular(20),
            //                     //         ),
            //                     //       ),
            //                     //       child: Center(
            //                     //         child: Text(
            //                     //           model
            //                     //               .getItemValueFromIndexs(
            //                     //                 tabNumber,
            //                     //                 2,
            //                     //                 index,
            //                     //               )
            //                     //               .toString(),
            //                     //           style: const TextStyle(
            //                     //             fontWeight: FontWeight.bold,
            //                     //             fontSize: 12,
            //                     //             color: Colors.white,
            //                     //           ),
            //                     //         ),
            //                     //       ),
            //                     //     ),
            //                     //   ),
            //                     // ),
            //                     // Visibility(
            //                     //   visible:
            //                     //       // dietLists['carbs']![0] != 0 &&
            //                     //       model.toggleDelete,
            //                     //   child: Transform.translate(
            //                     //     offset: const Offset(40, -10),
            //                     //     child: Container(
            //                     //       height: 40,
            //                     //       width: 40,
            //                     //       decoration: BoxDecoration(
            //                     //         border: Border.all(
            //                     //           color: const Color(0xFF272D2F),
            //                     //         ),
            //                     //         color: const Color(0xFFFE724C),
            //                     //         borderRadius: const BorderRadius.all(
            //                     //           Radius.circular(20),
            //                     //         ),
            //                     //       ),
            //                     //       child: Center(
            //                     //         child: IconButton(
            //                     //           icon: const Icon(
            //                     //             Icons.remove,
            //                     //             color: Colors.white,
            //                     //           ),
            //                     //           onPressed: () {},
            //                     //         ),
            //                     //       ),
            //                     //     ),
            //                     //   ),
            //                     // ),

            //                     // InkWell(
            //                     //   // ignore: avoid_print
            //                     //   onTap: model.toggleDelete
            //                     //       ? null
            //                     //       : () => model.incrementItem(
            //                     //             tabNumber,
            //                     //             2,
            //                     //             index,
            //                     //           ),
            //                     //   onLongPress: () =>
            //                     //       model.toggleDelete = !model.toggleDelete,
            //                     //   child:
            //                     Container(
            //                       width: 250,
            //                       height: 75,
            //                       decoration: BoxDecoration(
            //                         // ignore: use_full_hex_values_for_flutter_colors
            //                         color: const Color(0xFFF3B65A)
            //                             .withOpacity(0.2),
            //                         borderRadius: const BorderRadius.all(
            //                           Radius.circular(15),
            //                         ),
            //                       ),
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(18.0),
            //                         child: Text(
            //                           model.getItemNameFromIndexs(
            //                             tabNumber,
            //                             2,
            //                             index,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     // ),
            //                     Positioned(
            //                       bottom: 1.0,
            //                       child: Container(
            //                         decoration: BoxDecoration(
            //                           // ignore: use_full_hex_values_for_flutter_colors
            //                           color: const Color(0xFF84A94F)
            //                               .withOpacity(0.2),
            //                           borderRadius: const BorderRadius.all(
            //                             Radius.circular(15),
            //                           ),
            //                         ),
            //                         width:
            //                             MediaQuery.of(context).size.width / 4,
            //                         child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             SizedBox(
            //                               width: 32,
            //                               height: 32,
            //                               // ignore: deprecated_member_use
            //                               child: FlatButton(
            //                                 onPressed: () =>
            //                                     model.incrementItem(
            //                                   tabNumber,
            //                                   2,
            //                                   index,
            //                                 ),
            //                                 color: const Color.fromARGB(
            //                                   255,
            //                                   254,
            //                                   114,
            //                                   76,
            //                                 ),
            //                                 shape: const RoundedRectangleBorder(
            //                                   side: BorderSide(
            //                                     color: Color.fromARGB(
            //                                       255,
            //                                       39,
            //                                       45,
            //                                       47,
            //                                     ),
            //                                     width: 1.5,
            //                                   ),
            //                                   borderRadius: BorderRadius.all(
            //                                     Radius.circular(16),
            //                                   ),
            //                                 ),
            //                                 textColor: const Color.fromARGB(
            //                                   255,
            //                                   0,
            //                                   0,
            //                                   0,
            //                                 ),
            //                                 // ignore: use_named_constants
            //                                 padding: const EdgeInsets.all(0),
            //                                 child: const Icon(
            //                                   Icons.add,
            //                                   color: Colors.white,
            //                                 ),
            //                               ),
            //                             ),
            //                             Text(
            //                               model
            //                                   .getItemValueFromIndexs(
            //                                     tabNumber,
            //                                     2,
            //                                     index,
            //                                   )
            //                                   .toString(),
            //                             ),
            //                             SizedBox(
            //                               width: 32,
            //                               height: 32,
            //                               // ignore: deprecated_member_use
            //                               child: FlatButton(
            //                                 onPressed: () =>
            //                                     model.decrementItem(
            //                                   tabNumber,
            //                                   2,
            //                                   index,
            //                                 ),
            //                                 color: Colors.white,
            //                                 shape: const RoundedRectangleBorder(
            //                                   side: BorderSide(
            //                                     color: Color.fromARGB(
            //                                       255,
            //                                       39,
            //                                       45,
            //                                       47,
            //                                     ),
            //                                     width: 1.5,
            //                                   ),
            //                                   borderRadius: BorderRadius.all(
            //                                     Radius.circular(16),
            //                                   ),
            //                                 ),
            //                                 textColor: const Color.fromARGB(
            //                                   255,
            //                                   0,
            //                                   0,
            //                                   0,
            //                                 ),
            //                                 // ignore: use_named_constants
            //                                 padding: const EdgeInsets.all(0),
            //                                 child: const Icon(
            //                                   Icons.remove,
            //                                   color: Colors.black,
            //                                 ),
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     InputWidget(
            //       controller: null,
            //       onChanged: (s) {},
            //       onDone: () {},
            //       onEditingComplete: () {},
            //       validator: (String? s) {},
            //       hintText: 'Enter any other option',
            //       borderColor: Colors.grey,
            //       cursorColor: const Color(0xFFFE724C),
            //       labelText: 'Other option',
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 30),
            //       // ignore: deprecated_member_use
            //       child: FlatButton(
            //         onPressed: () => model.saveData(context),
            //         color: const Color.fromARGB(51, 254, 114, 76),
            //         shape: const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(16)),
            //         ),
            //         textColor: const Color(0xFFFE724C),
            //         child: const Text(
            //           "Save",
            //           textAlign: TextAlign.left,
            //           style: TextStyle(
            //             color: Color(0xFFFE724C),
            //             fontWeight: FontWeight.bold,
            //             fontSize: 20,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // customExpandableWidget(
            //   leading: Transform.translate(
            //     offset: const Offset(60, 0),
            //     child: Image.asset(
            //       'assets/images/bottomBar/glass.png',
            //       height: 50,
            //     ),
            //   ),
            //   tileColor: const Color(0xFF55C2F1).withOpacity(0.2),
            //   trailingColor: const Color(0xFF55C2F1),
            //   titleColor: const Color(0xFF55C2F1),
            //   title: 'Dariy',
            //   childerns: [
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     SizedBox(
            //       height: 180,
            //       child: GridView.count(
            //         scrollDirection: Axis.horizontal,
            //         mainAxisSpacing: 10.0,
            //         crossAxisCount: 2,
            //         children: List.generate(
            //           model.getItemsLengthFromIndexs(tabNumber, 3),
            //           (index) {
            //             return Center(
            //               child: Padding(
            //                 padding: const EdgeInsets.only(top: 10),
            //                 child: Stack(
            //                   children: [
            //                     // Visibility(
            //                     //   visible:
            //                     //       model.dietData[model.getTabNameFromIndexs(
            //                     //             tabNumber,
            //                     //           )]![model.getCatagoryNameFromIndexs(
            //                     //             tabNumber,
            //                     //             3,
            //                     //           )]![model.getItemNameFromIndexs(
            //                     //             tabNumber,
            //                     //             3,
            //                     //             index,
            //                     //           )] !=
            //                     //           0,
            //                     //   child: Transform.translate(
            //                     //     offset: const Offset(-5, -10),
            //                     //     child: Container(
            //                     //       height: 30,
            //                     //       width: 30,
            //                     //       decoration: BoxDecoration(
            //                     //         border: Border.all(
            //                     //           color: const Color(0xFF272D2F),
            //                     //         ),
            //                     //         color: const Color(0xFFFE724C),
            //                     //         borderRadius: const BorderRadius.all(
            //                     //           Radius.circular(20),
            //                     //         ),
            //                     //       ),
            //                     //       child: Center(
            //                     //         child: Text(
            //                     //           model
            //                     //               .getItemValueFromIndexs(
            //                     //                 tabNumber,
            //                     //                 3,
            //                     //                 index,
            //                     //               )
            //                     //               .toString(),
            //                     //           style: const TextStyle(
            //                     //             fontWeight: FontWeight.bold,
            //                     //             fontSize: 12,
            //                     //             color: Colors.white,
            //                     //           ),
            //                     //         ),
            //                     //       ),
            //                     //     ),
            //                     //   ),
            //                     // ),
            //                     // Visibility(
            //                     //   visible:
            //                     //       // dietLists['carbs']![0] != 0 &&
            //                     //       model.toggleDelete,
            //                     //   child: Transform.translate(
            //                     //     offset: const Offset(40, -10),
            //                     //     child: Container(
            //                     //       height: 40,
            //                     //       width: 40,
            //                     //       decoration: BoxDecoration(
            //                     //         border: Border.all(
            //                     //           color: const Color(0xFF272D2F),
            //                     //         ),
            //                     //         color: const Color(0xFFFE724C),
            //                     //         borderRadius: const BorderRadius.all(
            //                     //           Radius.circular(20),
            //                     //         ),
            //                     //       ),
            //                     //       child: Center(
            //                     //         child: IconButton(
            //                     //           icon: const Icon(
            //                     //             Icons.remove,
            //                     //             color: Colors.white,
            //                     //           ),
            //                     //           onPressed: () {},
            //                     //         ),
            //                     //       ),
            //                     //     ),
            //                     //   ),
            //                     // ),
            //                     // InkWell(
            //                     //   // ignore: avoid_print
            //                     //   onTap: model.toggleDelete
            //                     //       ? null
            //                     //       : () => model.incrementItem(
            //                     //             tabNumber,
            //                     //             3,
            //                     //             index,
            //                     //           ),
            //                     //   onLongPress: () =>
            //                     //       model.toggleDelete = !model.toggleDelete,
            //                     //   child:
            //                     Container(
            //                       width: 250,
            //                       height: 75,
            //                       decoration: BoxDecoration(
            //                         // ignore: use_full_hex_values_for_flutter_colors
            //                         color: const Color(0xFF55C2F1)
            //                             .withOpacity(0.2),
            //                         borderRadius: const BorderRadius.all(
            //                           Radius.circular(15),
            //                         ),
            //                       ),
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(18.0),
            //                         child: Text(
            //                           model.getItemNameFromIndexs(
            //                             tabNumber,
            //                             3,
            //                             index,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     // ),
            //                     Positioned(
            //                       bottom: 1.0,
            //                       child: Container(
            //                         decoration: BoxDecoration(
            //                           // ignore: use_full_hex_values_for_flutter_colors
            //                           color: const Color(0xFF84A94F)
            //                               .withOpacity(0.2),
            //                           borderRadius: const BorderRadius.all(
            //                             Radius.circular(15),
            //                           ),
            //                         ),
            //                         width:
            //                             MediaQuery.of(context).size.width / 4,
            //                         child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             SizedBox(
            //                               width: 32,
            //                               height: 32,
            //                               // ignore: deprecated_member_use
            //                               child: FlatButton(
            //                                 onPressed: () =>
            //                                     model.incrementItem(
            //                                   tabNumber,
            //                                   3,
            //                                   index,
            //                                 ),
            //                                 color: const Color.fromARGB(
            //                                   255,
            //                                   254,
            //                                   114,
            //                                   76,
            //                                 ),
            //                                 shape: const RoundedRectangleBorder(
            //                                   side: BorderSide(
            //                                     color: Color.fromARGB(
            //                                       255,
            //                                       39,
            //                                       45,
            //                                       47,
            //                                     ),
            //                                     width: 1.5,
            //                                   ),
            //                                   borderRadius: BorderRadius.all(
            //                                     Radius.circular(16),
            //                                   ),
            //                                 ),
            //                                 textColor: const Color.fromARGB(
            //                                   255,
            //                                   0,
            //                                   0,
            //                                   0,
            //                                 ),
            //                                 // ignore: use_named_constants
            //                                 padding: const EdgeInsets.all(0),
            //                                 child: const Icon(
            //                                   Icons.add,
            //                                   color: Colors.white,
            //                                 ),
            //                               ),
            //                             ),
            //                             Text(
            //                               model
            //                                   .getItemValueFromIndexs(
            //                                     tabNumber,
            //                                     3,
            //                                     index,
            //                                   )
            //                                   .toString(),
            //                             ),
            //                             SizedBox(
            //                               width: 32,
            //                               height: 32,
            //                               // ignore: deprecated_member_use
            //                               child: FlatButton(
            //                                 onPressed: () =>
            //                                     model.decrementItem(
            //                                   tabNumber,
            //                                   3,
            //                                   index,
            //                                 ),
            //                                 color: Colors.white,
            //                                 shape: const RoundedRectangleBorder(
            //                                   side: BorderSide(
            //                                     color: Color.fromARGB(
            //                                       255,
            //                                       39,
            //                                       45,
            //                                       47,
            //                                     ),
            //                                     width: 1.5,
            //                                   ),
            //                                   borderRadius: BorderRadius.all(
            //                                     Radius.circular(16),
            //                                   ),
            //                                 ),
            //                                 textColor: const Color.fromARGB(
            //                                   255,
            //                                   0,
            //                                   0,
            //                                   0,
            //                                 ),
            //                                 // ignore: use_named_constants
            //                                 padding: const EdgeInsets.all(0),
            //                                 child: const Icon(
            //                                   Icons.remove,
            //                                   color: Colors.black,
            //                                 ),
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     InputWidget(
            //       controller: null,
            //       onChanged: (s) {},
            //       onDone: () {},
            //       onEditingComplete: () {},
            //       validator: (String? s) {},
            //       hintText: 'Enter any other option',
            //       borderColor: Colors.grey,
            //       cursorColor: const Color(0xFFFE724C),
            //       labelText: 'Other option',
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 30),
            //       // ignore: deprecated_member_use
            //       child: FlatButton(
            //         onPressed: () => model.saveData(context),
            //         color: const Color.fromARGB(51, 254, 114, 76),
            //         shape: const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(16)),
            //         ),
            //         textColor: const Color(0xFFFE724C),
            //         child: const Text(
            //           "Save",
            //           textAlign: TextAlign.left,
            //           style: TextStyle(
            //             color: Color(0xFFFE724C),
            //             fontWeight: FontWeight.bold,
            //             fontSize: 20,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // customExpandableWidget(
            //   leading: Transform.translate(
            //     offset: const Offset(50, 0),
            //     child: Image.asset(
            //       'assets/images/bottomBar/fat.png',
            //       height: 50,
            //     ),
            //   ),
            //   tileColor: const Color(0xFFED8B88).withOpacity(0.2),
            //   trailingColor: const Color(0xFFED8B88),
            //   titleColor: const Color(0xFFED8B88),
            //   title: 'Fat',
            //   childerns: [
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     SizedBox(
            //       height: 180,
            //       child: GridView.count(
            //         scrollDirection: Axis.horizontal,
            //         mainAxisSpacing: 10.0,
            //         crossAxisCount: 2,
            //         children: List.generate(
            //           model.getItemsLengthFromIndexs(tabNumber, 4),
            //           (index) {
            //             return Center(
            //               child: Padding(
            //                 padding: const EdgeInsets.only(top: 10),
            //                 child: Stack(
            //                   children: [
            //                     // Visibility(
            //                     //   visible:
            //                     //       model.dietData[model.getTabNameFromIndexs(
            //                     //             tabNumber,
            //                     //           )]![model.getCatagoryNameFromIndexs(
            //                     //             tabNumber,
            //                     //             4,
            //                     //           )]![model.getItemNameFromIndexs(
            //                     //             tabNumber,
            //                     //             4,
            //                     //             index,
            //                     //           )] !=
            //                     //           0,
            //                     //   child: Transform.translate(
            //                     //     offset: const Offset(-5, -10),
            //                     //     child: Container(
            //                     //       height: 30,
            //                     //       width: 30,
            //                     //       decoration: BoxDecoration(
            //                     //         border: Border.all(
            //                     //           color: const Color(0xFF272D2F),
            //                     //         ),
            //                     //         color: const Color(0xFFFE724C),
            //                     //         borderRadius: const BorderRadius.all(
            //                     //           Radius.circular(20),
            //                     //         ),
            //                     //       ),
            //                     //       child: Center(
            //                     //         child: Text(
            //                     //           model
            //                     //               .getItemValueFromIndexs(
            //                     //                 tabNumber,
            //                     //                 4,
            //                     //                 index,
            //                     //               )
            //                     //               .toString(),
            //                     //           style: const TextStyle(
            //                     //             fontWeight: FontWeight.bold,
            //                     //             fontSize: 12,
            //                     //             color: Colors.white,
            //                     //           ),
            //                     //         ),
            //                     //       ),
            //                     //     ),
            //                     //   ),
            //                     // ),
            //                     // Visibility(
            //                     //   visible:
            //                     //       // dietLists['carbs']![0] != 0 &&
            //                     //       model.toggleDelete,
            //                     //   child: Transform.translate(
            //                     //     offset: const Offset(40, -10),
            //                     //     child: Container(
            //                     //       height: 40,
            //                     //       width: 40,
            //                     //       decoration: BoxDecoration(
            //                     //         border: Border.all(
            //                     //           color: const Color(0xFF272D2F),
            //                     //         ),
            //                     //         color: const Color(0xFFFE724C),
            //                     //         borderRadius: const BorderRadius.all(
            //                     //           Radius.circular(20),
            //                     //         ),
            //                     //       ),
            //                     //       child: Center(
            //                     //         child: IconButton(
            //                     //           icon: const Icon(
            //                     //             Icons.remove,
            //                     //             color: Colors.white,
            //                     //           ),
            //                     //           onPressed: () {},
            //                     //         ),
            //                     //       ),
            //                     //     ),
            //                     //   ),
            //                     // ),
            //                     // InkWell(
            //                     //   // ignore: avoid_print
            //                     //   onTap: model.toggleDelete
            //                     //       ? null
            //                     //       : () => model.incrementItem(
            //                     //             tabNumber,
            //                     //             4,
            //                     //             index,
            //                     //           ),
            //                     //   onLongPress: () =>
            //                     //       model.toggleDelete = !model.toggleDelete,
            //                     //   child:
            //                     Container(
            //                       width: 250,
            //                       height: 75,
            //                       decoration: BoxDecoration(
            //                         // ignore: use_full_hex_values_for_flutter_colors
            //                         color: const Color(0xFFED8B88)
            //                             .withOpacity(0.2),
            //                         borderRadius: const BorderRadius.all(
            //                           Radius.circular(15),
            //                         ),
            //                       ),
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(18.0),
            //                         child: Text(
            //                           model.getItemNameFromIndexs(
            //                             tabNumber,
            //                             4,
            //                             index,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     // ),
            //                     Positioned(
            //                       bottom: 1.0,
            //                       child: Container(
            //                         decoration: BoxDecoration(
            //                           // ignore: use_full_hex_values_for_flutter_colors
            //                           color: const Color(0xFF84A94F)
            //                               .withOpacity(0.2),
            //                           borderRadius: const BorderRadius.all(
            //                             Radius.circular(15),
            //                           ),
            //                         ),
            //                         width:
            //                             MediaQuery.of(context).size.width / 4,
            //                         child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             SizedBox(
            //                               width: 32,
            //                               height: 32,
            //                               // ignore: deprecated_member_use
            //                               child: FlatButton(
            //                                 onPressed: () =>
            //                                     model.incrementItem(
            //                                   tabNumber,
            //                                   4,
            //                                   index,
            //                                 ),
            //                                 color: const Color.fromARGB(
            //                                   255,
            //                                   254,
            //                                   114,
            //                                   76,
            //                                 ),
            //                                 shape: const RoundedRectangleBorder(
            //                                   side: BorderSide(
            //                                     color: Color.fromARGB(
            //                                       255,
            //                                       39,
            //                                       45,
            //                                       47,
            //                                     ),
            //                                     width: 1.5,
            //                                   ),
            //                                   borderRadius: BorderRadius.all(
            //                                     Radius.circular(16),
            //                                   ),
            //                                 ),
            //                                 textColor: const Color.fromARGB(
            //                                   255,
            //                                   0,
            //                                   0,
            //                                   0,
            //                                 ),
            //                                 // ignore: use_named_constants
            //                                 padding: const EdgeInsets.all(0),
            //                                 child: const Icon(
            //                                   Icons.add,
            //                                   color: Colors.white,
            //                                 ),
            //                               ),
            //                             ),
            //                             Text(
            //                               model
            //                                   .getItemValueFromIndexs(
            //                                     tabNumber,
            //                                     4,
            //                                     index,
            //                                   )
            //                                   .toString(),
            //                             ),
            //                             SizedBox(
            //                               width: 32,
            //                               height: 32,
            //                               // ignore: deprecated_member_use
            //                               child: FlatButton(
            //                                 onPressed: () =>
            //                                     model.decrementItem(
            //                                   tabNumber,
            //                                   4,
            //                                   index,
            //                                 ),
            //                                 color: Colors.white,
            //                                 shape: const RoundedRectangleBorder(
            //                                   side: BorderSide(
            //                                     color: Color.fromARGB(
            //                                       255,
            //                                       39,
            //                                       45,
            //                                       47,
            //                                     ),
            //                                     width: 1.5,
            //                                   ),
            //                                   borderRadius: BorderRadius.all(
            //                                     Radius.circular(16),
            //                                   ),
            //                                 ),
            //                                 textColor: const Color.fromARGB(
            //                                   255,
            //                                   0,
            //                                   0,
            //                                   0,
            //                                 ),
            //                                 // ignore: use_named_constants
            //                                 padding: const EdgeInsets.all(0),
            //                                 child: const Icon(
            //                                   Icons.remove,
            //                                   color: Colors.black,
            //                                 ),
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     InputWidget(
            //       controller: null,
            //       onChanged: (s) {},
            //       onDone: () {},
            //       onEditingComplete: () {},
            //       validator: (String? s) {},
            //       hintText: 'Enter any other option',
            //       borderColor: Colors.grey,
            //       cursorColor: const Color(0xFFFE724C),
            //       labelText: 'Other option',
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 30),
            //       // ignore: deprecated_member_use
            //       child: FlatButton(
            //         onPressed: () => model.saveData(context),
            //         color: const Color.fromARGB(51, 254, 114, 76),
            //         shape: const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(16)),
            //         ),
            //         textColor: const Color(0xFFFE724C),
            //         child: const Text(
            //           "Save",
            //           textAlign: TextAlign.left,
            //           style: TextStyle(
            //             color: Color(0xFFFE724C),
            //             fontWeight: FontWeight.bold,
            //             fontSize: 20,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // customExpandableWidget(
            //   leading: Transform.translate(
            //     offset: const Offset(50, 0),
            //     child: Image.asset(
            //       'assets/images/bottomBar/veg.png',
            //       height: 50,
            //     ),
            //   ),
            //   tileColor: const Color(0xFFB7DB71).withOpacity(0.2),
            //   trailingColor: const Color(0xFFB7DB71),
            //   titleColor: const Color(0xFFB7DB71),
            //   title: 'Vegies',
            //   childerns: [
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     SizedBox(
            //       height: 180,
            //       child: GridView.count(
            //         scrollDirection: Axis.horizontal,
            //         mainAxisSpacing: 10.0,
            //         crossAxisCount: 2,
            //         children: List.generate(
            //           model.getItemsLengthFromIndexs(tabNumber, 5),
            //           (index) {
            //             return Center(
            //               child: Padding(
            //                 padding: const EdgeInsets.only(top: 10),
            //                 child: Stack(
            //                   children: [
            //                     // Visibility(
            //                     //   visible:
            //                     //       model.dietData[model.getTabNameFromIndexs(
            //                     //             tabNumber,
            //                     //           )]![model.getCatagoryNameFromIndexs(
            //                     //             tabNumber,
            //                     //             5,
            //                     //           )]![model.getItemNameFromIndexs(
            //                     //             tabNumber,
            //                     //             5,
            //                     //             index,
            //                     //           )] !=
            //                     //           0,
            //                     //   child: Transform.translate(
            //                     //     offset: const Offset(-5, -10),
            //                     //     child: Container(
            //                     //       height: 30,
            //                     //       width: 30,
            //                     //       decoration: BoxDecoration(
            //                     //         border: Border.all(
            //                     //           color: const Color(0xFF272D2F),
            //                     //         ),
            //                     //         color: const Color(0xFFFE724C),
            //                     //         borderRadius: const BorderRadius.all(
            //                     //           Radius.circular(20),
            //                     //         ),
            //                     //       ),
            //                     //       child: Center(
            //                     //         child: Text(
            //                     //           model
            //                     //               .getItemValueFromIndexs(
            //                     //                 tabNumber,
            //                     //                 5,
            //                     //                 index,
            //                     //               )
            //                     //               .toString(),
            //                     //           style: const TextStyle(
            //                     //             fontWeight: FontWeight.bold,
            //                     //             fontSize: 12,
            //                     //             color: Colors.white,
            //                     //           ),
            //                     //         ),
            //                     //       ),
            //                     //     ),
            //                     //   ),
            //                     // ),
            //                     // Visibility(
            //                     //   visible:
            //                     //       // dietLists['carbs']![0] != 0 &&
            //                     //       model.toggleDelete,
            //                     //   child: Transform.translate(
            //                     //     offset: const Offset(40, -10),
            //                     //     child: Container(
            //                     //       height: 40,
            //                     //       width: 40,
            //                     //       decoration: BoxDecoration(
            //                     //         border: Border.all(
            //                     //           color: const Color(0xFF272D2F),
            //                     //         ),
            //                     //         color: const Color(0xFFFE724C),
            //                     //         borderRadius: const BorderRadius.all(
            //                     //           Radius.circular(20),
            //                     //         ),
            //                     //       ),
            //                     //       child: Center(
            //                     //         child: IconButton(
            //                     //           icon: const Icon(
            //                     //             Icons.remove,
            //                     //             color: Colors.white,
            //                     //           ),
            //                     //           onPressed: () {},
            //                     //         ),
            //                     //       ),
            //                     //     ),
            //                     //   ),
            //                     // ),
            //                     // InkWell(
            //                     //   // ignore: avoid_print
            //                     //   onTap: model.toggleDelete
            //                     //       ? null
            //                     //       : () => model.incrementItem(
            //                     //             tabNumber,
            //                     //             5,
            //                     //             index,
            //                     //           ),
            //                     //   onLongPress: () =>
            //                     //       model.toggleDelete = !model.toggleDelete,
            //                     //   child:
            //                     Container(
            //                       width: 250,
            //                       height: 75,
            //                       decoration: BoxDecoration(
            //                         // ignore: use_full_hex_values_for_flutter_colors
            //                         color: const Color(0xFFB7DB71)
            //                             .withOpacity(0.2),
            //                         borderRadius: const BorderRadius.all(
            //                           Radius.circular(15),
            //                         ),
            //                       ),
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(18.0),
            //                         child: Text(
            //                           model.getItemNameFromIndexs(
            //                             tabNumber,
            //                             5,
            //                             index,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     // ),
            //                     Positioned(
            //                       bottom: 1.0,
            //                       child: Container(
            //                         decoration: BoxDecoration(
            //                           // ignore: use_full_hex_values_for_flutter_colors
            //                           color: const Color(0xFF84A94F)
            //                               .withOpacity(0.2),
            //                           borderRadius: const BorderRadius.all(
            //                             Radius.circular(15),
            //                           ),
            //                         ),
            //                         width:
            //                             MediaQuery.of(context).size.width / 4,
            //                         child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             SizedBox(
            //                               width: 32,
            //                               height: 32,
            //                               // ignore: deprecated_member_use
            //                               child: FlatButton(
            //                                 onPressed: () =>
            //                                     model.incrementItem(
            //                                   tabNumber,
            //                                   5,
            //                                   index,
            //                                 ),
            //                                 color: const Color.fromARGB(
            //                                   255,
            //                                   254,
            //                                   114,
            //                                   76,
            //                                 ),
            //                                 shape: const RoundedRectangleBorder(
            //                                   side: BorderSide(
            //                                     color: Color.fromARGB(
            //                                       255,
            //                                       39,
            //                                       45,
            //                                       47,
            //                                     ),
            //                                     width: 1.5,
            //                                   ),
            //                                   borderRadius: BorderRadius.all(
            //                                     Radius.circular(16),
            //                                   ),
            //                                 ),
            //                                 textColor: const Color.fromARGB(
            //                                   255,
            //                                   0,
            //                                   0,
            //                                   0,
            //                                 ),
            //                                 // ignore: use_named_constants
            //                                 padding: const EdgeInsets.all(0),
            //                                 child: const Icon(
            //                                   Icons.add,
            //                                   color: Colors.white,
            //                                 ),
            //                               ),
            //                             ),
            //                             Text(
            //                               model
            //                                   .getItemValueFromIndexs(
            //                                     tabNumber,
            //                                     5,
            //                                     index,
            //                                   )
            //                                   .toString(),
            //                             ),
            //                             SizedBox(
            //                               width: 32,
            //                               height: 32,
            //                               // ignore: deprecated_member_use
            //                               child: FlatButton(
            //                                 onPressed: () =>
            //                                     model.decrementItem(
            //                                   tabNumber,
            //                                   5,
            //                                   index,
            //                                 ),
            //                                 color: Colors.white,
            //                                 shape: const RoundedRectangleBorder(
            //                                   side: BorderSide(
            //                                     color: Color.fromARGB(
            //                                       255,
            //                                       39,
            //                                       45,
            //                                       47,
            //                                     ),
            //                                     width: 1.5,
            //                                   ),
            //                                   borderRadius: BorderRadius.all(
            //                                     Radius.circular(16),
            //                                   ),
            //                                 ),
            //                                 textColor: const Color.fromARGB(
            //                                   255,
            //                                   0,
            //                                   0,
            //                                   0,
            //                                 ),
            //                                 // ignore: use_named_constants
            //                                 padding: const EdgeInsets.all(0),
            //                                 child: const Icon(
            //                                   Icons.remove,
            //                                   color: Colors.black,
            //                                 ),
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     InputWidget(
            //       controller: null,
            //       onChanged: (s) {},
            //       onDone: () {},
            //       onEditingComplete: () {},
            //       validator: (String? s) {},
            //       hintText: 'Enter any other option',
            //       borderColor: Colors.grey,
            //       cursorColor: const Color(0xFFFE724C),
            //       labelText: 'Other option',
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 30),
            //       // ignore: deprecated_member_use
            //       child: FlatButton(
            //         onPressed: () => model.saveData(context),
            //         color: const Color.fromARGB(51, 254, 114, 76),
            //         shape: const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(16)),
            //         ),
            //         textColor: const Color(0xFFFE724C),
            //         child: const Text(
            //           "Save",
            //           textAlign: TextAlign.left,
            //           style: TextStyle(
            //             color: Color(0xFFFE724C),
            //             fontWeight: FontWeight.bold,
            //             fontSize: 20,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  // Widget customExpandableWidget({
  //   required Widget leading,
  //   required Color trailingColor,
  //   required Color tileColor,
  //   required String title,
  //   required Color titleColor,
  //   required List<Widget>? childerns,
  //   bool isEnabled = true,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 10),
  //     child: Card(
  //       elevation: 0,
  //       color: Colors.white,
  //       child: RoundedExpansionTile(
  //         enabled: isEnabled,
  //         minVerticalPadding: 20,
  //         contentPadding: const EdgeInsets.symmetric(
  //           horizontal: 20,
  //           vertical: 10,
  //         ),
  //         leading: leading,
  //         trailing: Icon(
  //           Icons.keyboard_arrow_down,
  //           color: trailingColor,
  //         ),
  //         rotateTrailing: true,
  //         tileColor: tileColor,
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  //         title: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(
  //               title,
  //               style: TextStyle(
  //                 color: titleColor,
  //                 fontSize: 20,
  //               ),
  //             ),
  //           ],
  //         ),
  //         children: childerns,
  //       ),
  //     ),
  //   );

  // }
}
