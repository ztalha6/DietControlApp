import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function ontap;
  final bool showTrailing;
  const CustomListTile({
    required this.icon,
    required this.title,
    required this.ontap,
    this.showTrailing = true,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: MediaQuery.of(context).size.height * 0.074,
              height: MediaQuery.of(context).size.height * 0.074,
              decoration: const BoxDecoration(
                color: Color.fromARGB(51, 173, 175, 178),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 23,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: icon,
                  ),
                ],
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            trailing: showTrailing
                ? const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 15,
                  )
                : null,
            onTap: () {
              ontap();
            },
            selected: true,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Color(0xFFEFEFF0),
            ),
          )
        ],
      ),
    );
  }
}
