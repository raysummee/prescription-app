import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/core/config/app_config.dart';

class HorzCalender extends StatelessWidget {
  const HorzCalender({super.key});

  final List<String> _weekdays = const ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];

  @override
  Widget build(BuildContext context) {
    final start = DateTime.now().subtract(const Duration(days: 3));
    final dates = List.generate(7, (index) => start.add(Duration(days: index)));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: dates.mapIndexed((i,e)=> _buildItem(e, i)).toList(),
    );
  }

  Widget _buildItem(DateTime dateTime, int index){
    return Flexible(
      flex: index == 3?
        6:
        5,
      child: Builder(
        builder: (context) {
          final appTheme = AppConfig.of(context).appTheme;
          return Column(
            children: [
              Padding(
                padding: _calcPad(index),
                child: AspectRatio(
                  aspectRatio: 0.74,
                  child: Container(
                    decoration: BoxDecoration(
                      color: index==3? 
                        appTheme.colorPrimary:
                        appTheme.colorSecondary,
                      borderRadius: BorderRadius.circular(14.w)
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${dateTime.day}",
                      style: TextStyle(
                        color: index==3? 
                          appTheme.colorSecondary:
                          appTheme.colorTextSecondary,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                _weekdays[dateTime.weekday-1],
                style: TextStyle(
                  color: appTheme.colorTextSecondary,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          );
        }
      ),
    );
  }

  EdgeInsets _calcPad(int index){
    if(index==0){
      return EdgeInsets.only(right: 5.w);
    }
    if(index==6){
      return EdgeInsets.only(left: 5.w);
    }
    return EdgeInsets.symmetric(horizontal: 2.5.w);
  }
}