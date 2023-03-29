import 'package:app/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldAddMedicine extends StatelessWidget {
  const TextFieldAddMedicine({
    super.key, 
    required this.label,
    this.isLarge=false,
    this.dropList=const [],
    this.formatDropList
  });
  final String label;
  final bool isLarge;
  final List dropList;
  final String Function(dynamic val)? formatDropList;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    String Function(dynamic val) formatDropGenList;
    if(formatDropList==null){
      formatDropGenList= (val)=>val;
    }else{
      formatDropGenList = formatDropList!;
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(
          height: 10.h,
        ),
        dropList.isEmpty? TextFormField(
          maxLines: isLarge? 3: null,
          decoration: InputDecoration(
            hintText: "Enter $label",
            filled: true,
            fillColor: appTheme.colorTertiary,
            contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(35)
            ),
          ),
        ):
        Flexible(
          child: DropdownButtonFormField(
            items: dropList.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(formatDropGenList(e)),
              );
            }).toList(), 
            hint: Text(label),
            borderRadius: BorderRadius.circular(15),
            elevation: 1,
            decoration: InputDecoration(
              filled: true,
              fillColor: appTheme.colorTertiary,
              contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(35)
              ),
            ),
            onChanged: (value) {},
          ),
        )
      ],
    );
  }
}