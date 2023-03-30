import 'package:app/core/config/app_config.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldAddMedicine extends StatelessWidget {
  const TextFieldAddMedicine(
      {super.key,
      required this.label,
      this.isLarge = false,
      this.dropList = const [],
      this.formatDropList,
      this.onChange,
      this.validator});
  final String label;
  final bool isLarge;
  final List dropList;
  final String Function(dynamic val)? formatDropList;
  final Function(dynamic value)? onChange;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    List<String> formatDropGenList = [];
    if (formatDropList != null) {
      formatDropGenList = dropList.map((e) => formatDropList!(e)).toList();
    } else {
      if (dropList.isNotEmpty) {
        formatDropGenList = dropList as List<String>;
      }
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(
          height: 10.h,
        ),
        dropList.isEmpty
            ? TextFormField(
                maxLines: isLarge ? 3 : null,
                onChanged: onChange,
                validator: validator,
                decoration: InputDecoration(
                  hintText: "Enter $label",
                  filled: true,
                  fillColor: appTheme.colorTertiary,
                  contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(35)),
                ),
              )
            : Flexible(
                child: DropdownButtonFormField(
                  items: formatDropGenList.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  validator: validator,
                  hint: Text(label),
                  borderRadius: BorderRadius.circular(15),
                  elevation: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: appTheme.colorTertiary,
                    contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(35)),
                  ),
                  onChanged: (value) {
                    if (value == null || onChange == null) {
                      return;
                    }
                    int index = formatDropGenList.indexOf(value);
                    onChange!(dropList[index]);
                  },
                ),
              )
      ],
    );
  }
}
