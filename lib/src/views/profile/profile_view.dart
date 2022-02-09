import 'package:calories_counter/src/global/constants/widgets/input_widget.dart';
import 'package:calories_counter/src/views/profile/profile_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      onModelReady: (m) => m.init(),
      builder: (context, model, _) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Row(
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
                        width: 30,
                      ),
                      Text(
                        'Profile',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputWidget(
                        controller: model.nameController,
                        onChanged: (s) {},
                        onDone: () {},
                        onEditingComplete: () {},
                        validator: (String? s) {},
                        hintText: 'Enter name',
                        borderColor: Colors.grey,
                        cursorColor: Theme.of(context).primaryColor,
                        labelText: 'Name',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputWidget(
                        enabled: false,
                        controller: model.emailController,
                        onChanged: (s) {},
                        onDone: () {},
                        onEditingComplete: () {},
                        validator: (String? s) {},
                        hintText: 'Enter email',
                        borderColor: Colors.grey,
                        cursorColor: Theme.of(context).primaryColor,
                        labelText: 'Email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputWidget(
                        controller: model.phoneController,
                        onChanged: (s) {},
                        onDone: () {},
                        onEditingComplete: () {},
                        validator: (String? s) {},
                        hintText: 'Enter mobile numer',
                        borderColor: Colors.grey,
                        cursorColor: Theme.of(context).primaryColor,
                        labelText: 'Mobile Number',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Select Gender',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Radio(
                            fillColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor,
                            ),
                            value: 0,
                            groupValue: model.radioValue,
                            onChanged: (s) {
                              model.radioValue = s! as int;
                            },
                          ),
                          const Text(
                            'Male',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Radio(
                            fillColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor,
                            ),
                            value: 1,
                            groupValue: model.radioValue,
                            onChanged: (s) {
                              model.radioValue = s! as int;
                            },
                          ),
                          const Text(
                            'Female',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Radio(
                            fillColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor,
                            ),
                            value: 2,
                            groupValue: model.radioValue,
                            onChanged: (s) {
                              model.radioValue = s! as int;
                            },
                          ),
                          const Text(
                            'Other',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Height Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                decoration: const BoxDecoration(
                                  // ignore: use_full_hex_values_for_flutter_colors
                                  color: Color.fromARGB(51, 254, 114, 76),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Text(
                                  '${model.height} ft',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 32,
                                    height: 32,
                                    // ignore: deprecated_member_use
                                    child: FlatButton(
                                      onPressed: () => model.incrementHeight(
                                        increment: true,
                                      ),
                                      color: const Color.fromARGB(
                                          255, 254, 114, 76),
                                      shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 39, 45, 47),
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                      textColor:
                                          const Color.fromARGB(255, 0, 0, 0),
                                      padding: const EdgeInsets.all(0),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 32,
                                    height: 32,
                                    // ignore: deprecated_member_use
                                    child: FlatButton(
                                      onPressed: () => model.incrementHeight(),
                                      color: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 39, 45, 47),
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                      textColor:
                                          const Color.fromARGB(255, 0, 0, 0),
                                      padding: EdgeInsets.all(0),
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          //const SizedBox(width: 30),
                          Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                decoration: const BoxDecoration(
                                  // ignore: use_full_hex_values_for_flutter_colors
                                  color: Color.fromARGB(51, 254, 114, 76),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Text(
                                  '${model.weight} ft',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 32,
                                    height: 32,
                                    // ignore: deprecated_member_use
                                    child: FlatButton(
                                      onPressed: () => model.incrementWeight(
                                        increment: true,
                                      ),
                                      color: const Color.fromARGB(
                                          255, 254, 114, 76),
                                      shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 39, 45, 47),
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                      textColor:
                                          const Color.fromARGB(255, 0, 0, 0),
                                      padding: const EdgeInsets.all(0),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 32,
                                    height: 32,
                                    // ignore: deprecated_member_use
                                    child: FlatButton(
                                      onPressed: () => model.incrementWeight(),
                                      color: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 39, 45, 47),
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                      textColor:
                                          const Color.fromARGB(255, 0, 0, 0),
                                      padding: EdgeInsets.all(0),
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed: () => model.save(),
                          color: const Color.fromARGB(51, 254, 114, 76),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          textColor: Theme.of(context).primaryColor,
                          child: Text(
                            "Save",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
