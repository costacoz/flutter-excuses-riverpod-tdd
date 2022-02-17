import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/core/utils/types.dart';
import 'package:riverpod_practice/presentation/provider/excuse_event.dart';

import '../../provider_injection.dart';

class ExcuseControls extends StatefulWidget {
  const ExcuseControls({Key? key}) : super(key: key);

  @override
  _ExcuseControlsState createState() => _ExcuseControlsState();
}

class _ExcuseControlsState extends State<ExcuseControls> {
  var dropdownValue = ExcuseCategory.office;

  void onDropdownChange(ExcuseCategory? newValue) {
    setState(() {
      dropdownValue = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExcuseCategoryDropdown(dropdownValue, onDropdownChange),
        const SizedBox(height: 10),
        Row(
          children: [
            const Expanded(
              child: GetRandomExcuseButton(),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GetExcuseByCategoryButton(dropdownValue),
            ),
          ],
        ),
      ],
    );
  }
}

class GetExcuseByCategoryButton extends ConsumerWidget {
  final ExcuseCategory dropdownValue;

  const GetExcuseByCategoryButton(this.dropdownValue, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      child: const Text("Get excuse by category"),
      style: ElevatedButton.styleFrom(primary: const ColorScheme.light().primary),
      onPressed: () => ref.watch(excuseNotifierProvider.notifier).mapEventToState(GetExcuseByCategoryEvent(describeEnum(dropdownValue))),
    );
  }
}

class GetRandomExcuseButton extends ConsumerWidget {
  const GetRandomExcuseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      child: const Text("Get random excuse"),
      style: ElevatedButton.styleFrom(primary: const ColorScheme.light().secondary),
      onPressed: () => ref.watch(excuseNotifierProvider.notifier).mapEventToState(const GetRandomExcuseEvent()),
    );
  }
}

class ExcuseCategoryDropdown extends ConsumerWidget {
  final ExcuseCategory dropdownValue;
  final void Function(ExcuseCategory?) onChanged;

  const ExcuseCategoryDropdown(this.dropdownValue, this.onChanged, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton<ExcuseCategory>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      isExpanded: true,
      style: const TextStyle(color: Colors.deepPurple, fontSize: 24.0),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: onChanged,
      items: ExcuseCategory.values.map<DropdownMenuItem<ExcuseCategory>>((ExcuseCategory value) {
        return DropdownMenuItem<ExcuseCategory>(
          value: value,
          child: Text(describeEnum(value)),
        );
      }).toList(),
    );
  }
}
