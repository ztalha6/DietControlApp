import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

class CustomExpandableWidget extends StatelessWidget {
  final Widget leading;
  final Color? trailingColor;
  final Color tileColor;
  final String title;
  final Color titleColor;
  final bool isEnabled;
  const CustomExpandableWidget({
    Key? key,
    required this.leading,
    this.trailingColor,
    required this.tileColor,
    required this.title,
    required this.titleColor,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: RoundedExpansionTile(
          enabled: isEnabled,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          leading: leading,
          trailing: const SizedBox(),
          rotateTrailing: true,
          tileColor: tileColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          children: const [],
        ),
      ),
    );
  }
}
