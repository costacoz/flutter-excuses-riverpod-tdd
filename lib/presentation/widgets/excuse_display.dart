import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_practice/domain/entities/excuse.dart';

class ExcuseDisplay extends StatelessWidget {
  final Excuse excuse;

  const ExcuseDisplay({Key? key, required this.excuse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: [
          Text(
            "Category: ${describeEnum(excuse.category)}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            child: Text(
              excuse.excuse,
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}