import 'package:flutter/material.dart';

enum DoseEnums { notTaken, taken, pending }

extension DoseEnumsExt on DoseEnums {
  Color get color {
    switch (this) {
      case DoseEnums.taken:
        return const Color.fromRGBO(231, 244, 235, 1);
      case DoseEnums.pending:
        return const Color.fromRGBO(244, 246, 250, 1);
      case DoseEnums.notTaken:
        return const Color.fromRGBO(253, 242, 240, 1);
    }
  }

  String get iconUri {
    switch (this) {
      case DoseEnums.taken:
        return "assets/icons/done.png";
      case DoseEnums.pending:
        return "assets/icons/pending.png";
      case DoseEnums.notTaken:
        return "assets/icons/reject.png";
    }
  }
}
