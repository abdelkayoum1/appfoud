import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class dividerr extends StatelessWidget {
  const dividerr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.black.withOpacity(0.3))),
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8),
          child: Text(
            'or continue with',
            style: TextStyle(
              fontFamily: 'Nimbus Sans',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.black.withOpacity(0.3))),
      ],
    );
  }
}
