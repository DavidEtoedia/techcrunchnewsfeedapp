import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/services/api/Model/country_model.dart';
import 'package:food_app/ui/vm/health_vm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CountryList extends HookConsumerWidget {
  CountryList({Key? key}) : super(key: key);
  final firstRadioStateProvider = StateProvider<int>((ref) {
    return 0;
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggle = ref.watch(firstRadioStateProvider.state);

    int val = 0;
    return Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        height: 290,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: country.length,
          itemBuilder: (context, index) {
            final list = country[index];
            return RadioListTile<int>(
              value: list.value!,
              groupValue: toggle.state,
              onChanged: (value) {
                toggle.state = value!;

                ref.read(healthProvider.notifier).healthTab(list.countryId!);
              },
              toggleable: true,
              controlAffinity: ListTileControlAffinity.trailing,
              tileColor: Colors.grey[100],
              title: Text(
                list.country.toString(),
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 10,
            );
          },
        ));
  }
}
