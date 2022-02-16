import 'package:calories_counter/src/global/constants/widgets/custom_list_tile.dart';
import 'package:calories_counter/src/views/account/account_viewModel.dart';
import 'package:calories_counter/src/views/pref_intake/pref_intake_view.dart';
import 'package:calories_counter/src/views/profile/profile_view.dart';
import 'package:calories_counter/src/views/sign_in/sign_in_view.dart';
import 'package:calories_counter/src/views/subscribtion/subscribtion_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountViewModel>.reactive(
      viewModelBuilder: () => AccountViewModel(),
      onModelReady: (m) => m.getData(),
      builder: (context, model, _) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 136,
          titleTextStyle: Theme.of(context).textTheme.headline6,
          title: Transform.translate(
            offset: const Offset(20, 0),
            child: const Text(
              'Account',
              //style:,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                CustomListTile(
                  icon: Image.asset(
                    "assets/images/bottomBar/profile.png",
                    fit: BoxFit.fill,
                    color: Colors.black,
                  ),
                  title: 'Profile',
                  ontap: () => navigateToProfileVew(context),
                ),
                CustomListTile(
                  icon: Image.asset(
                    "assets/images/profile/prefintakes.png",
                    fit: BoxFit.fill,
                    color: Colors.black,
                  ),
                  title: 'Preferred Intake / day',
                  ontap: () => navigateToPrefVew(context),
                ),
                CustomListTile(
                  icon: Image.asset(
                    "assets/images/profile/backup.png",
                    fit: BoxFit.fill,
                    color: Colors.black,
                  ),
                  title: 'Backup to Drive',
                  ontap: () => model.backUptoDrive(),
                ),
                CustomListTile(
                  icon: Image.asset(
                    "assets/images/profile/inapp.png",
                    fit: BoxFit.fill,
                    color: Colors.black,
                  ),
                  title: 'In-App',
                  ontap: () => navigateToSubscribeVew(context),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomListTile(
                  icon: Image.asset(
                    "assets/images/profile/logout.png",
                    fit: BoxFit.fill,
                    color: Colors.black,
                  ),
                  title: 'Log out',
                  ontap: () {
                    model.signOut(context);
                  },
                  showTrailing: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToProfileVew(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => const ProfileView()),
    );
  }

  void navigateToSubscribeVew(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => SubscribeView()),
    );
  }

  void navigateToPrefVew(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => const PreferIntakeView()),
    );
  }
}
