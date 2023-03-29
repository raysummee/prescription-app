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
    this.dropList=const []
  });
  final String label;
  final bool isLarge;
  final List dropList;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          maxLines: isLarge? 3: null,
          decoration: InputDecoration(
            suffixIcon: dropList.isNotEmpty? Icon(
              Icons.arrow_drop_down,
              size: 32.sp,
            ):null,
            suffixIconConstraints: BoxConstraints.tight(Size(60, 50)),
            hintText: "Enter $label",
            filled: true,
            fillColor: appTheme.colorTertiary,
            contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(35)
            ),
            
          ),
        )
      ],
    );
  }
}