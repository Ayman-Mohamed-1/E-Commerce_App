
import 'package:flutter/material.dart';

class BackBtnAc extends StatelessWidget {
  const BackBtnAc({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back,
          size: 30,
        ),
      ),
    );
  }
}
