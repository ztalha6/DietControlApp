import 'package:calories_counter/src/global/constants/widgets/custom_expention_tile.dart';
import 'package:calories_counter/src/views/pref_intake/pref_intake_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PreferIntakeView extends StatelessWidget {
  const PreferIntakeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PreferIntakeViewModel>.reactive(
      viewModelBuilder: () => PreferIntakeViewModel(),
      builder: (context, model, _) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: const BoxDecoration(
                            // ignore: use_full_hex_values_for_flutter_colors
                            color: Color.fromARGB(51, 173, 175, 178),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.320,
                        child: Text(
                          'Preferred intakes per day',
                          style: Theme.of(context).textTheme.headline6,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/prefIntake/male.png',
                        height: 80,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Male',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  for (var i = 0; i < model.prefIntakes.length; i++)
                    CustomExpandableWidget(
                      leading: Transform.translate(
                        offset: const Offset(25, 0),
                        child: Image.asset(
                          model.prefIntakesImages[i],
                          height: 40,
                        ),
                      ),
                      tileColor: model.prefIntakesColors[i].withOpacity(0.2),
                      title: model.prefIntakes[i],
                      titleColor: model.prefIntakesColors[i],
                      isEnabled: false,
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/prefIntake/female.png',
                        height: 80,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Female',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  for (var i = 0; i < model.prefIntakes.length; i++)
                    CustomExpandableWidget(
                      leading: Transform.translate(
                        offset: const Offset(25, 0),
                        child: Image.asset(
                          model.prefIntakesImages[i],
                          height: 40,
                        ),
                      ),
                      tileColor: model.prefIntakesColors[i].withOpacity(0.2),
                      title: model.prefIntakes[i],
                      titleColor: model.prefIntakesColors[i],
                      isEnabled: false,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
