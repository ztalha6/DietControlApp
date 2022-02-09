import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      child: const CircularProgressIndicator(
        strokeWidth: 1.5,
        color: Colors.white,
      ),
    );
  }
}
