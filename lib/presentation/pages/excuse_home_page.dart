import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/provider_injection.dart';

import '../widgets/widgets.dart';

class ExcuseHomePage extends StatelessWidget {
  const ExcuseHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Excuse Generator'),
      ),
      body: buildBody(context),
    );
  }

  Center buildBody(context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final state = ref.watch(excuseNotifierProvider);
                return state.when(
                  empty: () => const MessageDisplay(message: "Find an excuse!"),
                  loading: () => const LoadingIndicator(),
                  loaded: (excuse) => ExcuseDisplay(excuse: excuse),
                  error: (errorMessage) => MessageDisplay(message: errorMessage),
                );
              },
            ),
            const SizedBox(height: 20),
            const ExcuseControls(),
          ],
        ),
      ),
    );
  }
}
